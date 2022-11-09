//
//  GitHubRepositorieshRouter.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import UIKit
import GitHubRepositoriesNetworkClient
class GitHubRepositoriesRouter: PresenterToRouterGitHubRepositoriesProtocol {
 
    static func createModule(gitHubRepositoriesViewController: GitHubRepositoriesViewController) {
        let presenter = GitHubRepositoriesPresenter()
        
        gitHubRepositoriesViewController.gitHubRepositoriesPresenter = presenter
        
        gitHubRepositoriesViewController.gitHubRepositoriesPresenter?.gitHubRepositoriesInteractor = GitHubRepositoriesInteractor()
        
        gitHubRepositoriesViewController.gitHubRepositoriesPresenter?.gitHubRepositoriesView = gitHubRepositoriesViewController
        gitHubRepositoriesViewController.gitHubRepositoriesPresenter?.gitHubRepositoriesInteractor?.presenter = presenter
        gitHubRepositoriesViewController.gitHubRepositoriesPresenter?.gitHubRepositoriesInteractor?.networkClient = NetworkClient.shared
        
//        let giHubRepositoriesInteractor = GitHubRepositoriesInteractor()
//        giHubRepositoriesInteractor.networkClient = NetworkClient.shared
    }
    
    static func pushToGitHubRepositoryDetialsScreen(gitHubRepository: GitHubRepositoryToView,
                                          navigationConroller navigationController: UINavigationController) {
        let gitHubRepositoryDetailsModuel = GitHubRepositoryDetailsRouter.createModule(gitHubRepositoriesDetailsViewController: GitHubRepositoriesDetailsViewController())
        gitHubRepositoryDetailsModuel.gitHubRepositoriesDetailsPresenter?.gitHubRepositoryDetails = gitHubRepository
        navigationController.pushViewController(gitHubRepositoryDetailsModuel,
                                                animated: true)
    }
}
