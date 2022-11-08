//
//  Owner.swift
//  GitHubRepositoriesNetworkClient
//
//  Created by Passant Abdelatif on 07/11/2022.
//
//
//import Foundation
//import CoreData
//public class GitHubRepositoryOwner: NSManagedObject, Codable {
//    
//    enum CodingKeys: String, CodingKey {
//        case starredUrl = "starred_url"
//        case organizationsUrl = "organizations_url"
//        case gistsUrl = "gists_url"
//        case url
//        case followingUrl = "following_url"
//        case siteAdmin = "site_admin"
//        case nodeId = "node_id"
//        case subscriptionsUrl = "subscriptions_url"
//        case login
//        case gravatarId = "gravatar_id"
//        case receivedEventsUrl = "received_events_url"
//        case avatarUrl = "avatar_url"
//        case id
//        case htmlUrl = "html_url"
//        case followersUrl = "followers_url"
//        case type
//        case eventsUrl = "events_url"
//        case reposUrl = "repos_url"
//    }
//    
//    var starredUrl: String?
//    var organizationsUrl: String?
//    var gistsUrl: String?
//    var url: String?
//    var followingUrl: String?
//    var siteAdmin: Bool?
//    var nodeId: String?
//    var subscriptionsUrl: String?
//    var gravatarId: String?
//    var receivedEventsUrl: String?
//    public var id: Int32?
//    var htmlUrl: String?
//    var followersUrl: String?
//    var type: String?
//    var eventsUrl: String?
//    var reposUrl: String?
//    
//    required convenience public init(from decoder: Decoder) throws {
////        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
////            throw DecoderConfigurationError.missingManagedObjectContext
////        }
////
////        self.init(context: context)
//        
//        let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.managedObjectContext
//        guard let managedObjectContext = decoder.userInfo[codingUserInfoKeyManagedObjectContext] as? NSManagedObjectContext,
//              let entity = NSEntityDescription.entity(forEntityName: "GitHubRepositoryModel",
//                                                      in: managedObjectContext) else {
//            fatalError("Failed to decode User")
//        }
//        
//        self.init(entity: entity, insertInto: managedObjectContext)
//        
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        starredUrl = try container.decodeIfPresent(String.self, forKey: .starredUrl)
//        organizationsUrl = try container.decodeIfPresent(String.self, forKey: .organizationsUrl)
//        gistsUrl = try container.decodeIfPresent(String.self, forKey: .gistsUrl)
//        url = try container.decodeIfPresent(String.self, forKey: .url)
//        followingUrl = try container.decodeIfPresent(String.self, forKey: .followingUrl)
//        siteAdmin = try container.decodeIfPresent(Bool.self, forKey: .siteAdmin)
//        nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
//        subscriptionsUrl = try container.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
//        login = try container.decodeIfPresent(String.self, forKey: .login)
//        gravatarId = try container.decodeIfPresent(String.self, forKey: .gravatarId)
//        receivedEventsUrl = try container.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
//        avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
//        id = try container.decodeIfPresent(Int32.self, forKey: .id)
//        htmlUrl = try container.decodeIfPresent(String.self, forKey: .htmlUrl)
//        followersUrl = try container.decodeIfPresent(String.self, forKey: .followersUrl)
//        type = try container.decodeIfPresent(String.self, forKey: .type)
//        eventsUrl = try container.decodeIfPresent(String.self, forKey: .eventsUrl)
//        reposUrl = try container.decodeIfPresent(String.self, forKey: .reposUrl)
//    }
//    
//    // MARK: - Encodable
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(organizationsUrl, forKey: .organizationsUrl)
//        try container.encode(reposUrl, forKey: .reposUrl)
//        try container.encode(htmlUrl, forKey: .htmlUrl)
//        try container.encode(siteAdmin, forKey: .siteAdmin)
//        try container.encode(gravatarId, forKey: .gravatarId)
//        try container.encode(starredUrl, forKey: .starredUrl)
//        try container.encode(avatarUrl, forKey: .avatarUrl)
//        try container.encode(type, forKey: .type)
//        try container.encode(gistsUrl, forKey: .gistsUrl)
//        try container.encode(login, forKey: .login)
//        try container.encode(followersUrl, forKey: .followersUrl)
//        try container.encode(id, forKey: .id)
//        try container.encode(subscriptionsUrl, forKey: .subscriptionsUrl)
//        try container.encode(followingUrl, forKey: .followingUrl)
//        try container.encode(receivedEventsUrl, forKey: .receivedEventsUrl)
//        try container.encode(nodeId, forKey: .nodeId)
//        try container.encode(url, forKey: .url)
//        try container.encode(eventsUrl, forKey: .eventsUrl)
//    }
//    
//}
//
//extension CodingUserInfoKey {
//    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
//}
//enum DecoderConfigurationError: Error {
//    case missingManagedObjectContext
//}
//
////extension GitHubRepositoryOwner {
////
////
////
////    @NSManaged public var login: String?
////    @NSManaged public var avatarUrl: String?
////   
////
////}
