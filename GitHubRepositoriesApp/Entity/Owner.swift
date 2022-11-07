//
//  Owner.swift
//
//  Created by Passant Abdelatif on 06/11/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

class Owner: Codable {

  enum CodingKeys: String, CodingKey {
    case reposUrl = "repos_url"
    case organizationsUrl = "organizations_url"
    case type
    case starredUrl = "starred_url"
    case followersUrl = "followers_url"
    case url
    case subscriptionsUrl = "subscriptions_url"
    case id
    case siteAdmin = "site_admin"
    case htmlUrl = "html_url"
    case login
    case avatarUrl = "avatar_url"
    case receivedEventsUrl = "received_events_url"
    case eventsUrl = "events_url"
    case nodeId = "node_id"
    case gravatarId = "gravatar_id"
    case followingUrl = "following_url"
    case gistsUrl = "gists_url"
  }

  var reposUrl: String?
  var organizationsUrl: String?
  var type: String?
  var starredUrl: String?
  var followersUrl: String?
  var url: String?
  var subscriptionsUrl: String?
  var id: Int?
  var siteAdmin: Bool?
  var htmlUrl: String?
  var login: String?
  var avatarUrl: String?
  var receivedEventsUrl: String?
  var eventsUrl: String?
  var nodeId: String?
  var gravatarId: String?
  var followingUrl: String?
  var gistsUrl: String?

  init (reposUrl: String?, organizationsUrl: String?, type: String?, starredUrl: String?, followersUrl: String?, url: String?, subscriptionsUrl: String?, id: Int?, siteAdmin: Bool?, htmlUrl: String?, login: String?, avatarUrl: String?, receivedEventsUrl: String?, eventsUrl: String?, nodeId: String?, gravatarId: String?, followingUrl: String?, gistsUrl: String?) {
    self.reposUrl = reposUrl
    self.organizationsUrl = organizationsUrl
    self.type = type
    self.starredUrl = starredUrl
    self.followersUrl = followersUrl
    self.url = url
    self.subscriptionsUrl = subscriptionsUrl
    self.id = id
    self.siteAdmin = siteAdmin
    self.htmlUrl = htmlUrl
    self.login = login
    self.avatarUrl = avatarUrl
    self.receivedEventsUrl = receivedEventsUrl
    self.eventsUrl = eventsUrl
    self.nodeId = nodeId
    self.gravatarId = gravatarId
    self.followingUrl = followingUrl
    self.gistsUrl = gistsUrl
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    reposUrl = try container.decodeIfPresent(String.self, forKey: .reposUrl)
    organizationsUrl = try container.decodeIfPresent(String.self, forKey: .organizationsUrl)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    starredUrl = try container.decodeIfPresent(String.self, forKey: .starredUrl)
    followersUrl = try container.decodeIfPresent(String.self, forKey: .followersUrl)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    subscriptionsUrl = try container.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    siteAdmin = try container.decodeIfPresent(Bool.self, forKey: .siteAdmin)
    htmlUrl = try container.decodeIfPresent(String.self, forKey: .htmlUrl)
    login = try container.decodeIfPresent(String.self, forKey: .login)
    avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
    receivedEventsUrl = try container.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
    eventsUrl = try container.decodeIfPresent(String.self, forKey: .eventsUrl)
    nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
    gravatarId = try container.decodeIfPresent(String.self, forKey: .gravatarId)
    followingUrl = try container.decodeIfPresent(String.self, forKey: .followingUrl)
    gistsUrl = try container.decodeIfPresent(String.self, forKey: .gistsUrl)
  }

}
