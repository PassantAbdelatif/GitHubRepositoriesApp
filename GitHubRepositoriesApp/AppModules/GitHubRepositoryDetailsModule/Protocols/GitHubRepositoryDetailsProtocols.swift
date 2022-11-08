//
//  GitHubRepositoriesProtocols.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 05/11/2022.
//

import Foundation

protocol ViewToPresenterGitHubRepositoryDetailsProtocol {
    var gitHubRepositoryDetailsInteractor: PresenterToInteractorGitHubRepositoryDetailsProtocol? {get set}
    var gitHubRepositoryDetailsView: PresenterToViewGitHubRepositoryDetailsProtocol? {get set}
    
    var gitHubRepositoryDetails: GitHubRepositoryToView? {get set}
    func shareGitHubRepositoryUrl()
    func openGitHubRepositoryWebsiteOnSafari()
}

protocol PresenterToInteractorGitHubRepositoryDetailsProtocol {
    var presenter: InteractorToPresenterGitHubRepositoryDetailsProtocol? {get set}
    func shareGitHubrepositoryUrl(gitHubRepositoryDetails: GitHubRepositoryToView)
    func openGitHubrepositoryWebsiteOnSafari(gitHubRepositoryDetails: GitHubRepositoryToView)
}

protocol InteractorToPresenterGitHubRepositoryDetailsProtocol {
    func sendDataFailed(error: String)
}

protocol PresenterToViewGitHubRepositoryDetailsProtocol {
    func startGitHubRepositoryDetailsViewLoader()
    func endGitHubRepositoryDetailsViewLoader()
    func sendErrorToView(error: String)
}

protocol PresenterToRouterGitHubRepositoryDetailsProtocol {
    static func createModule(gitHubRepositoriesDetailsViewController: GitHubRepositoriesDetailsViewController) -> GitHubRepositoriesDetailsViewController
}
