//
//  RecipeDetailsRouter.swift
//  RecipeSearchApp
//
//  Created by Passant Abdelatif on 05/11/2022.
//

import Foundation

class GitHubRepositoryDetailsRouter: PresenterToRouterGitHubRepositoryDetailsProtocol {
    static func createModule(gitHubRepositoriesDetailsViewController gitHubRepositoryDetailsViewController: GitHubRepositoriesDetailsViewController) -> GitHubRepositoriesDetailsViewController {
        let presenter = GitHubRepositoryDetailsPresenter()
        
        gitHubRepositoryDetailsViewController.gitHubRepositoriesDetailsPresenter = presenter
        
        gitHubRepositoryDetailsViewController.gitHubRepositoriesDetailsPresenter?.gitHubRepositoryDetailsInteractor = GithubRepositoryDetailsInteractor()
        gitHubRepositoryDetailsViewController.gitHubRepositoriesDetailsPresenter?.gitHubRepositoryDetailsView = gitHubRepositoryDetailsViewController
        
        gitHubRepositoryDetailsViewController.gitHubRepositoriesDetailsPresenter?.gitHubRepositoryDetailsInteractor?.presenter = presenter
        
        return gitHubRepositoryDetailsViewController
    }
    
}
