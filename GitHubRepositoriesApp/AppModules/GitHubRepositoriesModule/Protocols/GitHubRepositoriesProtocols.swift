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
    
    var page: Int {get set}
    var repositoriesCountPerPage: Int {get set}
    var hasNext: Bool? {get set}
    var searchString: String? {get set}
    var repositoriesToSearchIn: [GitHubRepositoryToView]? {get set}
    var screenSearchMode: GitHubRepositoriesSearchViewMode? {get set}
    
    func getGitHubRepositoriesSearchResult()
    func getGitHubRepositoriesPerPage()
}

protocol PresenterToInteractorGitHubRepositoriesProtocol {
    var presenter: InteractorToPresenterGitHubRepositoriesProtocol? {get set}
    var page: Int {get set}
    var repositoriesCountPerPage: Int {get set}
    var searchString: String? {get set}
    
    func getGitHubRepositoriesSearchResult(gitHubRepositoriesToFilter: [GitHubRepository],
                                           searchString: String)
    func getGitHubRepositoriesPerPage(screenSearchMode: GitHubRepositoriesSearchViewMode)
}

protocol InteractorToPresenterGitHubRepositoriesProtocol {
    func sendGitHubRepositoriesToPresenter(gitHubRepositories: [GitHubRepositoryToView],
                                           hasNextPage: Bool)
    func sendDataFailed(error: String)
    func sendFilteredGitHubRepositoriesToPresenter(gitHubRepositories: [GitHubRepositoryToView])
}

protocol PresenterToViewGitHubRepositoriesProtocol {
    func startViewLoader()
    func endViewLoader()
    func sendGitHubRepositoriesToView(gitHubRepositories: [GitHubRepositoryToView])
    func sendErrorToView(error: String)
    func sendFilteredGitHubRepositoriesToView(gitHubRepositories: [GitHubRepositoryToView])
}

protocol PresenterToRouterGitHubRepositoriesProtocol {
    static func createModule(gitHubRepositoriesViewController: GitHubRepositoriesViewController)
}
