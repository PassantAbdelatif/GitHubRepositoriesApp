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
        
        name = try container.decodeIfPresent(String.self, forKey: .name)
        owner = try container.decodeIfPresent(Owner.self, forKey: .owner)
    }

    public func dictionaryRepresentation() -> [String: Any] {
      var dictionary: [String: Any] = [:]

        if let value = owner { dictionary[CodingKeys.owner.rawValue] = value.dictionaryRepresentation() }
        if let value = name { dictionary[CodingKeys.name.rawValue] = value }
    
      return dictionary
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(owner, forKey: .owner)
    }
    
    
}

struct GitHubRepositoryToView {
    let name: String?
    let owner: OwnerToView?
}



extension GitHubRepository {
    func toGitHubRepositoryModel() -> GitHubRepositoryToView {
        let owner = self.owner as? Owner
        
        return GitHubRepositoryToView(name: self.name,
                                      owner:  owner?.toOwnerModel())
    }
}
