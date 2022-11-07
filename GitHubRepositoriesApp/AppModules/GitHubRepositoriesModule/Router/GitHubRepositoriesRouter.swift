//
//  GitHubRepositorieshRouter.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import UIKit

class GitHubRepositoriesRouter: PresenterToRouterGitHubRepositoriesProtocol {
 
    static func createModule(gitHubRepositoriesViewController: GitHubRepositoriesViewController) {
        let presenter = GitHubRepositoriesPresenter()
        
        gitHubRepositoriesViewController.gitHubRepositoriesPresenter = presenter
        
        gitHubRepositoriesViewController.gitHubRepositoriesPresenter?.gitHubRepositoriesInteractor = GitHubRepositoriesInteractor()
        gitHubRepositoriesViewController.gitHubRepositoriesPresenter?.gitHubRepositoriesView = gitHubRepositoriesViewController
        
        gitHubRepositoriesViewController.gitHubRepositoriesPresenter?.gitHubRepositoriesInteractor?.presenter = presenter
    }
    
}
