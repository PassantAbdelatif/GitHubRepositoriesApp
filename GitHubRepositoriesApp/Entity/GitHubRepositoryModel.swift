//
//  RequestModel.swift
//  CoreDataFramework
//
//  Created by Passant Abdelatif on 22/10/2022.
//
//
//import Foundation
//import CoreData
//@objc(GitHubRepositoryModel)
//public class GitHubRepositoryModel: NSManagedObject, Codable {
//    
//    enum CodingKeys: String, CodingKey {
//        case descriptionValue = "description"
//        case collaboratorsUrl = "collaborators_url"
//        case mergesUrl = "merges_url"
//        case gitCommitsUrl = "git_commits_url"
//        case issuesUrl = "issues_url"
//        case owner
//        case repositoryName = "name"
//        case gitRefsUrl = "git_refs_url"
//        case assigneesUrl = "assignees_url"
//        case fork
//        case contributorsUrl = "contributors_url"
//        case downloadsUrl = "downloads_url"
//        case notificationsUrl = "notifications_url"
//        case keysUrl = "keys_url"
//        case deploymentsUrl = "deployments_url"
//        case url
//        case compareUrl = "compare_url"
//        case forksUrl = "forks_url"
//        case labelsUrl = "labels_url"
//        case commentsUrl = "comments_url"
//        case archiveUrl = "archive_url"
//        case languagesUrl = "languages_url"
//        case nodeId = "node_id"
//        case stargazersUrl = "stargazers_url"
//        case contentsUrl = "contents_url"
//        case gitTagsUrl = "git_tags_url"
//        case statusesUrl = "statuses_url"
//        case teamsUrl = "teams_url"
//        case fullName = "full_name"
//        case milestonesUrl = "milestones_url"
//        case tagsUrl = "tags_url"
//        case subscriptionUrl = "subscription_url"
//        case htmlUrl = "html_url"
//        case releasesUrl = "releases_url"
//        case commitsUrl = "commits_url"
//        case hooksUrl = "hooks_url"
//        case issueCommentUrl = "issue_comment_url"
//        case pullsUrl = "pulls_url"
//        case subscribersUrl = "subscribers_url"
//        case issueEventsUrl = "issue_events_url"
//        case branchesUrl = "branches_url"
//        case id
//        case blobsUrl = "blobs_url"
//        case eventsUrl = "events_url"
//        case treesUrl = "trees_url"
//        case isPrivate = "private"
//    }
//    // MARK: - Core Data Managed Object
//    public var descriptionValue: String?
//    var collaboratorsUrl: String?
//    var mergesUrl: String?
//    var gitCommitsUrl: String?
//    var issuesUrl: String?
//    //public var owner: GitHubRepositoryOwner?
//   // public var name: String?
//    var gitRefsUrl: String?
//    var assigneesUrl: String?
//    var fork: Bool?
//    var contributorsUrl: String?
//    var downloadsUrl: String?
//    var notificationsUrl: String?
//    var keysUrl: String?
//    var deploymentsUrl: String?
//    var url: String?
//    var compareUrl: String?
//    var forksUrl: String?
//    var labelsUrl: String?
//    var commentsUrl: String?
//    var archiveUrl: String?
//    var languagesUrl: String?
//    var nodeId: String?
//    var stargazersUrl: String?
//    var contentsUrl: String?
//    var gitTagsUrl: String?
//    var statusesUrl: String?
//    var teamsUrl: String?
//    var fullName: String?
//    var milestonesUrl: String?
//    var tagsUrl: String?
//    var subscriptionUrl: String?
//    var htmlUrl: String?
//    var releasesUrl: String?
//    var commitsUrl: String?
//    var hooksUrl: String?
//    var issueCommentUrl: String?
//    var pullsUrl: String?
//    var subscribersUrl: String?
//    var issueEventsUrl: String?
//    var branchesUrl: String?
//    public var id: Int?
//    var blobsUrl: String?
//    var eventsUrl: String?
//    var treesUrl: String?
//    var isPrivate: Bool?
//    
//    required convenience public init(from decoder: Decoder) throws {
////        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
////            throw DecoderConfigurationError.missingManagedObjectContext
////        }
////
////        self.init(context: context)
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
//        
//        mergesUrl = try container.decodeIfPresent(String.self, forKey: .mergesUrl)
//        blobsUrl = try container.decodeIfPresent(String.self, forKey: .blobsUrl)
//        assigneesUrl = try container.decodeIfPresent(String.self, forKey: .assigneesUrl)
//        branchesUrl = try container.decodeIfPresent(String.self, forKey: .branchesUrl)
//        pullsUrl = try container.decodeIfPresent(String.self, forKey: .pullsUrl)
//        subscribersUrl = try container.decodeIfPresent(String.self, forKey: .subscribersUrl)
//        gitRefsUrl = try container.decodeIfPresent(String.self, forKey: .gitRefsUrl)
//        contributorsUrl = try container.decodeIfPresent(String.self, forKey: .contributorsUrl)
//        issueCommentUrl = try container.decodeIfPresent(String.self, forKey: .issueCommentUrl)
//        id = try container.decodeIfPresent(Int.self, forKey: .id)
//        compareUrl = try container.decodeIfPresent(String.self, forKey: .compareUrl)
//        forksUrl = try container.decodeIfPresent(String.self, forKey: .forksUrl)
//        eventsUrl = try container.decodeIfPresent(String.self, forKey: .eventsUrl)
//        url = try container.decodeIfPresent(String.self, forKey: .url)
//        teamsUrl = try container.decodeIfPresent(String.self, forKey: .teamsUrl)
//        releasesUrl = try container.decodeIfPresent(String.self, forKey: .releasesUrl)
//        treesUrl = try container.decodeIfPresent(String.self, forKey: .treesUrl)
//        htmlUrl = try container.decodeIfPresent(String.self, forKey: .htmlUrl)
//        collaboratorsUrl = try container.decodeIfPresent(String.self, forKey: .collaboratorsUrl)
//        fork = try container.decodeIfPresent(Bool.self, forKey: .fork)
//        commitsUrl = try container.decodeIfPresent(String.self, forKey: .commitsUrl)
//        issuesUrl = try container.decodeIfPresent(String.self, forKey: .issuesUrl)
//        repositoryName = try container.decodeIfPresent(String.self, forKey: .repositoryName)
//        descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
//        subscriptionUrl = try container.decodeIfPresent(String.self, forKey: .subscriptionUrl)
//        contentsUrl = try container.decodeIfPresent(String.self, forKey: .contentsUrl)
//        gitCommitsUrl = try container.decodeIfPresent(String.self, forKey: .gitCommitsUrl)
//        archiveUrl = try container.decodeIfPresent(String.self, forKey: .archiveUrl)
//        commentsUrl = try container.decodeIfPresent(String.self, forKey: .commentsUrl)
//        owner = try container.decodeIfPresent(GitHubRepositoryOwner.self, forKey: .owner)
//        hooksUrl = try container.decodeIfPresent(String.self, forKey: .hooksUrl)
//        issueEventsUrl = try container.decodeIfPresent(String.self, forKey: .issueEventsUrl)
//        languagesUrl = try container.decodeIfPresent(String.self, forKey: .languagesUrl)
//        gitTagsUrl = try container.decodeIfPresent(String.self, forKey: .gitTagsUrl)
//        statusesUrl = try container.decodeIfPresent(String.self, forKey: .statusesUrl)
//        keysUrl = try container.decodeIfPresent(String.self, forKey: .keysUrl)
//        isPrivate = try container.decodeIfPresent(Bool.self, forKey: .isPrivate)
//        nodeId = try container.decodeIfPresent(String.self, forKey: .nodeId)
//        fullName = try container.decodeIfPresent(String.self, forKey: .fullName)
//        stargazersUrl = try container.decodeIfPresent(String.self, forKey: .stargazersUrl)
//        notificationsUrl = try container.decodeIfPresent(String.self, forKey: .notificationsUrl)
//        milestonesUrl = try container.decodeIfPresent(String.self, forKey: .milestonesUrl)
//        tagsUrl = try container.decodeIfPresent(String.self, forKey: .tagsUrl)
//        downloadsUrl = try container.decodeIfPresent(String.self, forKey: .downloadsUrl)
//        deploymentsUrl = try container.decodeIfPresent(String.self, forKey: .deploymentsUrl)
//        labelsUrl = try container.decodeIfPresent(String.self, forKey: .labelsUrl)
//    }
//    
//    
//    // MARK: - Encodable
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(pullsUrl, forKey: .pullsUrl)
//        try container.encode(forksUrl, forKey: .forksUrl)
//        try container.encode(tagsUrl, forKey: .tagsUrl)
//        try container.encode(subscribersUrl, forKey: .subscribersUrl)
//        try container.encode(isPrivate, forKey: .isPrivate)
//        try container.encode(releasesUrl, forKey: .releasesUrl)
//        try container.encode(gitTagsUrl, forKey: .gitTagsUrl)
//        try container.encode(contentsUrl, forKey: .contentsUrl)
//        try container.encode(statusesUrl, forKey: .statusesUrl)
//        try container.encode(id, forKey: .id)
//        try container.encode(issueEventsUrl, forKey: .issueEventsUrl)
//        try container.encode(downloadsUrl, forKey: .downloadsUrl)
//        try container.encode(owner, forKey: .owner)
//        try container.encode(commentsUrl, forKey: .commentsUrl)
//        try container.encode(teamsUrl, forKey: .teamsUrl)
//        try container.encode(gitRefsUrl, forKey: .gitRefsUrl)
//        try container.encode(url, forKey: .url)
//        try container.encode(stargazersUrl, forKey: .stargazersUrl)
//        try container.encode(hooksUrl, forKey: .hooksUrl)
//        try container.encode(contributorsUrl, forKey: .contributorsUrl)
//        try container.encode(repositoryName, forKey: .repositoryName)
//        try container.encode(htmlUrl, forKey: .htmlUrl)
//        try container.encode(issuesUrl, forKey: .issuesUrl)
//        try container.encode(treesUrl, forKey: .treesUrl)
//        try container.encode(fullName, forKey: .fullName)
//        try container.encode(descriptionValue, forKey: .descriptionValue)
//        try container.encode(subscriptionUrl, forKey: .subscriptionUrl)
//        try container.encode(notificationsUrl, forKey: .notificationsUrl)
//        try container.encode(keysUrl, forKey: .keysUrl)
//        try container.encode(fork, forKey: .fork)
//        try container.encode(compareUrl, forKey: .compareUrl)
//        try container.encode(issueCommentUrl, forKey: .issueCommentUrl)
//        try container.encode(languagesUrl, forKey: .languagesUrl)
//        try container.encode(branchesUrl, forKey: .branchesUrl)
//        try container.encode(commitsUrl, forKey: .commitsUrl)
//        try container.encode(assigneesUrl, forKey: .assigneesUrl)
//        try container.encode(gitCommitsUrl, forKey: .gitCommitsUrl)
//        try container.encode(archiveUrl, forKey: .archiveUrl)
//        try container.encode(labelsUrl, forKey: .labelsUrl)
//        try container.encode(deploymentsUrl, forKey: .deploymentsUrl)
//        try container.encode(milestonesUrl, forKey: .milestonesUrl)
//        try container.encode(collaboratorsUrl, forKey: .collaboratorsUrl)
//        try container.encode(mergesUrl, forKey: .mergesUrl)
//        try container.encode(nodeId, forKey: .nodeId)
//        try container.encode(blobsUrl, forKey: .blobsUrl)
//        try container.encode(eventsUrl, forKey: .eventsUrl)
//    }
//}
//
