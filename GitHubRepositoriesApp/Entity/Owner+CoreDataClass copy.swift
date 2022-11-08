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
        case ownerId = "id"
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
        ownerId = try container.decodeIfPresent(Int32.self, forKey: .ownerId) ?? 0
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
        try container.encode(ownerId, forKey: .ownerId)
    }
}

struct OwnerToView {
    let name: String?
    let avatarUrl: String?
    let ownerId: Int32?
    init(managedObject: NSManagedObject) {
        self.name = managedObject.value(forKey: "login") as? String
        self.avatarUrl = managedObject.value(forKey: "avatarUrl") as? String
        self.ownerId = managedObject.value(forKey: "ownerId") as? Int32
    }
}
