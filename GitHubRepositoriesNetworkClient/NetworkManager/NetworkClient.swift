//
//  NetworkClient.swift
//  NetworkClient
//
//  Created by Passant Abdelatif on 22/10/2022.
//

import Foundation
import CoreData

public class NetworkClient {
    public static var shared = NetworkClient()
    
    // MARK: Network requests
    public func get<T>(_ url: URL, completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable {
        executeRequest(url, method: "GET", payload: nil, completionHandler: completionHandler)
    }
    
    public func post<T>(_ url: URL, payload: Data?=nil, completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable {
        executeRequest(url, method: "POSt", payload: payload, completionHandler: completionHandler)
    }
    
    public func put<T>(_ url: URL, payload: Data?=nil, completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable {
        executeRequest(url, method: "PUT", payload: payload, completionHandler: completionHandler)
    }
    
    public func delete<T>(_ url: URL, completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable{
      
        executeRequest(url, method: "DELETE", payload: nil, completionHandler: completionHandler)
    }
    func executeRequest<T>(_ url: URL,
                        method: String,
                        payload: Data?,
                        completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = payload
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
                var errorDomain: String?
                var errorCode: Int16?
                if let error = error as? NSError {
                    errorCode = Int16(error.code)
                    errorDomain = error.domain
                }

            if let httpResponse = response as? HTTPURLResponse,
                let result = data{
                let code = Int16(httpResponse.statusCode)
                switch code {
                case 200...299:
                    do {
                        let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext
                        let managedObjectContext = NetworkDataManager.shared.backgroundContext
                        let decoder = JSONDecoder()
                        decoder.userInfo[codingUserInfoKeyManagedObjectContext] = managedObjectContext
                        _ = try decoder.decode([T].self, from: result)
                      
                        try managedObjectContext.save()
                        
                       completionHandler(.success([]))
                    } catch let error {
                        print(String(data: result, encoding: .utf8) ?? "nothing received")
                        completionHandler(.failure(error))
                    }
                default:
                    // 300-399 ,400-499
                    do {
                        let businessError = try JSONDecoder().decode( [NetworkError].self,
                                                                      from: result)
                        if businessError.count > 0 {
                            completionHandler(.failure(businessError.first!))
                        }
                    } catch {
                        completionHandler(.failure(NetworkError.parseError))
                    }
                }
            }
            
        }.resume()
    }
    

    
    // MARK: Network recording
    public func allGitHubRepositroies() -> [NSManagedObject]? {
        //fatalError("Not implemented")
        if let allRequests = NetworkDataManager.shared.fetch(entity: GitHubRepository.self) {
            return allRequests
        }
        return nil
    }
}
