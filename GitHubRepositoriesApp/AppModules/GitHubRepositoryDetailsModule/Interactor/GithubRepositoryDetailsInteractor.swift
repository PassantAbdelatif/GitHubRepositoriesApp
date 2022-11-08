//
//  RecipeDetailsInteractor.swift
//  RecipeSearchApp
//
//  Created by Passant Abdelatif on 05/11/2022.
//

import UIKit
class GithubRepositoryDetailsInteractor: PresenterToInteractorGitHubRepositoryDetailsProtocol {
    func shareGitHubrepositoryUrl(gitHubRepositoryDetails: GitHubRepositoryToView) {
        if let repositoryUrl = gitHubRepositoryDetails.url {
            let data = [ repositoryUrl] as [Any]
            UIApplication.share(data)
        }
    }
    func openGitHubrepositoryWebsiteOnSafari(gitHubRepositoryDetails: GitHubRepositoryToView) {
        if let repositoryUrl = gitHubRepositoryDetails.url {
            UIApplication.shared.openURLWithSafariBrowser(repositoryUrl)
        }
    }
    
    
    var presenter: InteractorToPresenterGitHubRepositoryDetailsProtocol?
    
}

