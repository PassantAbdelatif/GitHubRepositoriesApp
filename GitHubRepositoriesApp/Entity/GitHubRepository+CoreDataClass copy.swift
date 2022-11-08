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
        case url = "url"
        case repositoryDescription = "description"
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
        url = try container.decodeIfPresent(String.self, forKey: .url)
        repositoryDescription = try container.decodeIfPresent(String.self, forKey: .repositoryDescription)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        owner = try container.decodeIfPresent(Owner.self, forKey: .owner)
    }

    public func dictionaryRepresentation() -> [String: Any] {
      var dictionary: [String: Any] = [:]

        if let value = owner { dictionary[CodingKeys.owner.rawValue] = value.dictionaryRepresentation() }
        if let value = name { dictionary[CodingKeys.name.rawValue] = value }
        if let value = repositoryDescription { dictionary[CodingKeys.repositoryDescription.rawValue] = value }
        if let value = url { dictionary[CodingKeys.url.rawValue] = value }
        if let value = repositoryId as? Int32 {
            dictionary[CodingKeys.repositoryId.rawValue] = value
        }
    
      return dictionary
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(url, forKey: .url)
        try container.encode(repositoryDescription, forKey: .repositoryDescription)
        try container.encode(owner, forKey: .owner)
        try container.encode(repositoryId, forKey: .repositoryId)
    }
    
    
}

struct GitHubRepositoryToView {
    let name: String?
    let url: String?
    let repositoryDescription: String?
    let repositoryId: Int32?
    var owner: OwnerToView?
    init(managedObject: NSManagedObject) {
        self.name = managedObject.value(forKey: "name") as? String
        self.url = managedObject.value(forKey: "url") as? String
        self.repositoryDescription = managedObject.value(forKey: "repositoryDescription") as? String
        self.repositoryId = managedObject.value(forKey: "repositoryId") as? Int32
        if let owner = managedObject.value(forKey: "owner") as? NSManagedObject {
            let ownerToView = OwnerToView(managedObject: owner)
            self.owner = ownerToView
        }
    }
}

