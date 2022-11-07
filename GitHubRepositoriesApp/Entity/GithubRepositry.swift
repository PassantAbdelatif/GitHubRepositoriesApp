//
//  GetGithubRepositriesResponse.swift
//
//  Created by Passant Abdelatif on 06/11/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

class GithubRepositry: Codable {

  enum CodingKeys: String, CodingKey {
    case descriptionValue = "description"
    case collaboratorsUrl = "collaborators_url"
    case mergesUrl = "merges_url"
    case gitCommitsUrl = "git_commits_url"
    case issuesUrl = "issues_url"
    case owner
    case name
    case gitRefsUrl = "git_refs_url"
    case assigneesUrl = "assignees_url"
    case fork
    case contributorsUrl = "contributors_url"
    case downloadsUrl = "downloads_url"
    case notificationsUrl = "notifications_url"
    case keysUrl = "keys_url"
    case deploymentsUrl = "deployments_url"
    case url
    case compareUrl = "compare_url"
    case forksUrl = "forks_url"
    case labelsUrl = "labels_url"
    case commentsUrl = "comments_url"
    case archiveUrl = "archive_url"
    case languagesUrl = "languages_url"
    case nodeId = "node_id"
    case stargazersUrl = "stargazers_url"
    case contentsUrl = "contents_url"
    case gitTagsUrl = "git_tags_url"
    case statusesUrl = "statuses_url"
    case teamsUrl = "teams_url"
    case fullName = "full_name"
    case milestonesUrl = "milestones_url"
    case tagsUrl = "tags_url"
    case subscriptionUrl = "subscription_url"
    case htmlUrl = "html_url"
    case releasesUrl = "releases_url"
    case commitsUrl = "commits_url"
    case hooksUrl = "hooks_url"
    case issueCommentUrl = "issue_comment_url"
    case pullsUrl = "pulls_url"
    case subscribersUrl = "subscribers_url"
    case issueEventsUrl = "issue_events_url"
    case branchesUrl = "branches_url"
    case id
    case blobsUrl = "blobs_url"
    case eventsUrl = "events_url"
    case treesUrl = "trees_url"
    case isPrivate = "private"
  }

  var descriptionValue: String?
  var collaboratorsUrl: String?
  var mergesUrl: String?
  var gitCommitsUrl: String?
  var issuesUrl: String?
  var owner: Owner?
  var name: String?
  var gitRefsUrl: String?
  var assigneesUrl: String?
  var fork: Bool?
  var contributorsUrl: String?
  var downloadsUrl: String?
  var notificationsUrl: String?
  var keysUrl: String?
  var deploymentsUrl: String?
  var url: String?
  var compareUrl: String?
  var forksUrl: String?
  var labelsUrl: String?
  var commentsUrl: String?
  var archiveUrl: String?
  var languagesUrl: String?
  var nodeId: String?
  var stargazersUrl: String?
  var contentsUrl: String?
  var gitTagsUrl: String?
  var statusesUrl: String?
  var teamsUrl: String?
  var fullName: String?
  var milestonesUrl: String?
  var tagsUrl: String?
  var subscriptionUrl: String?
  var htmlUrl: String?
  var releasesUrl: String?
  var commitsUrl: String?
  var hooksUrl: String?
  var issueCommentUrl: String?
  var pullsUrl: String?
  var subscribersUrl: String?
  var issueEventsUrl: String?
  var branchesUrl: String?
  var id: Int?
  var blobsUrl: String?
  var eventsUrl: String?
  var treesUrl: String?
  var isPrivate: Bool?

}
