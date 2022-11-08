//
//  GitHubRepository+CoreDataClass.swift
//  
//
//  Created by Passant Abdelatif on 08/11/2022.
//
//

import Foundation
import CoreData

extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

@objc(GitHubRepository)
public class GitHubRepository: NSManagedObject, Codable {
    
    enum CodingKeys: String, CodingKey {
        case repositoryId = "id"
        case name = "name"
        case owner = "owner"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext
        guard let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "GitHubRepository",
                                                      in: managedObjectContext) else {
            fatalError("Failed to decode GitHubRepository")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        repositoryId = try container.decodeIfPresent(Int32.self, forKey: .repositoryId) ?? 0
        name = try container.decodeIfPresent(String.self, forKey: .name)
        owner = try container.decodeIfPresent(Owner.self, forKey: .owner)
    }

    public func dictionaryRepresentation() -> [String: Any] {
      var dictionary: [String: Any] = [:]

        if let value = owner { dictionary[CodingKeys.owner.rawValue] = value.dictionaryRepresentation() }
        if let value = name { dictionary[CodingKeys.name.rawValue] = value }
        if let value = repositoryId as? Int32 {
            dictionary[CodingKeys.repositoryId.rawValue] = value
        }
    
      return dictionary
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(owner, forKey: .owner)
        try container.encode(repositoryId, forKey: .repositoryId)
    }
    
    
}

struct GitHubRepositoryToView {
    let name: String?
    let repositoryId: Int32?
    let owner: OwnerToView?
}



extension GitHubRepository {
    func toGitHubRepositoryModel() -> GitHubRepositoryToView {
        let owner = self.owner
        
        return GitHubRepositoryToView(name: self.name,
                                      repositoryId: self.repositoryId,
                                      owner:  owner?.toOwnerModel())
    }
}
