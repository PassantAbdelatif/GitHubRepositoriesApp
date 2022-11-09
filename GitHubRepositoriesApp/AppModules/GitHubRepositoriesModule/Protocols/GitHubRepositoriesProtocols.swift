//
//  GitHubRepositoriesProtocols.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 03/11/2022.
//

import UIKit
import GitHubRepositoriesNetworkClient

protocol ViewToPresenterGitHubRepositoriesProtocol {
    var gitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol? {get set}
    var gitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol? {get set}
    
    var page: Int {get set}
    var repositoriesCountPerPage: Int {get set}
    var hasNext: Bool? {get set}
    var searchString: String? {get set}
    var screenSearchMode: GitHubRepositoriesSearchViewMode? {get set}
    
    func getGitHubRepositoriesPerPage()
}

protocol PresenterToInteractorGitHubRepositoriesProtocol {
    var presenter: InteractorToPresenterGitHubRepositoriesProtocol? {get set}
    var page: Int {get set}
    var repositoriesCountPerPage: Int {get set}
    var searchString: String? {get set}
    var networkClient: NetworkClient? {get set}
    func getGitHubRepositoriesPerPage(screenSearchMode: GitHubRepositoriesSearchViewMode)
    func getAllGitHubRepositories()
    func getGitHubRepositoriesSavedInCoreDataPerPage()
}

protocol InteractorToPresenterGitHubRepositoriesProtocol {
    func sendGitHubRepositoriesToPresenter(gitHubRepositories: [GitHubRepositoryToView],
                                           hasNextPage: Bool)
    func sendDataFailed(error: String)
}

protocol PresenterToViewGitHubRepositoriesProtocol {
    func startViewLoader()
    func endViewLoader()
    func sendGitHubRepositoriesToView(gitHubRepositories: [GitHubRepositoryToView])
    func sendErrorToView(error: String)
}

protocol PresenterToRouterGitHubRepositoriesProtocol {
    static func createModule(gitHubRepositoriesViewController: GitHubRepositoriesViewController)
    static func pushToGitHubRepositoryDetialsScreen(gitHubRepository: GitHubRepositoryToView,
                                                    navigationConroller navigationController: UINavigationController)
}
