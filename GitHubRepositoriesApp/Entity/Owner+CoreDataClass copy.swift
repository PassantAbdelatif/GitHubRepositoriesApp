//
//  Owner+CoreDataClass.swift
//  
//
//  Created by Passant Abdelatif on 08/11/2022.
//
//

import Foundation
import CoreData

@objc(Owner)
public class Owner: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatarUrl = "avatar_url"
    }
    required convenience public init(from decoder: Decoder) throws {
        
        let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext
        guard let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Owner",
                                                      in: managedObjectContext) else {
            fatalError("Failed to decode Owner")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        login = try container.decodeIfPresent(String.self, forKey: .login)
        avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
    }
    
    public func dictionaryRepresentation() -> [String: Any] {
      var dictionary: [String: Any] = [:]

        if let value = login { dictionary[CodingKeys.login.rawValue] = value }
        if let value = avatarUrl { dictionary[CodingKeys.avatarUrl.rawValue] = value }
    
      return dictionary
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(login, forKey: .login)
        try container.encode(avatarUrl, forKey: .avatarUrl)
    }
}

extension Owner {
    func toOwnerModel() -> OwnerToView {
        return OwnerToView(name: self.login,
                           avatarUrl: self.avatarUrl)
    }
}
struct OwnerToView {
    let name: String?
    let avatarUrl: String?
}
