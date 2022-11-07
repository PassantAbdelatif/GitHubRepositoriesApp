//
//  GitHubRepositoriesProtocols.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 03/11/2022.
//

import UIKit

protocol ViewToPresenterGitHubRepositoriesProtocol {
    var gitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol? {get set}
    var gitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol? {get set}
    
    var page: Int? {get set}
    var repositoriesCountPerPage: Int? {get set}
    var hasNext: Bool? {get set}
    var searchString: String? {get set}
    var repositoriesToSearchIn: [GithubRepositry]? {get set}
    
    func getGitHubRepositoriesSearchResult()
    func getGitHubRepositoriesPerPage()
}

protocol PresenterToInteractorGitHubRepositoriesProtocol {
    var presenter: InteractorToPresenterGitHubRepositoriesProtocol? {get set}
    
    func getGitHubRepositoriesSearchResult(gitHubRepositoriesToFilter: [GithubRepositry],
                                           searchString: String)
    func getGitHubRepositoriesPerPage(page: Int,
                                      repositoriesCountPerPage: Int)
}

protocol InteractorToPresenterGitHubRepositoriesProtocol {
    func sendGitHubRepositoriesToPresenter(gitHubRepositories: [GithubRepositry],
                                           hasNextPage: Bool)
    func sendDataFailed(error: String)
    func sendFilteredGitHubRepositoriesToPresenter(gitHubRepositories: [GithubRepositry])
}

protocol PresenterToViewGitHubRepositoriesProtocol {
    func startViewLoader()
    func endViewLoader()
    func sendGitHubRepositoriesToView(gitHubRepositories: [GithubRepositry])
    func sendErrorToView(error: String)
    func sendFilteredGitHubRepositoriesToView(gitHubRepositories: [GithubRepositry])
}

protocol PresenterToRouterGitHubRepositoriesProtocol {
    static func createModule(gitHubRepositoriesViewController: GitHubRepositoriesViewController)
}
