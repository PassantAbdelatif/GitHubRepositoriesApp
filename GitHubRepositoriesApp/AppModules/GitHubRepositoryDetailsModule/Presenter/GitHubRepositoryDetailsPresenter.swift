//
//  RecipeDetailsPresenter.swift
//  RecipeSearchApp
//
//  Created by Passant Abdelatif on 05/11/2022.
//

import Foundation
class GitHubRepositoryDetailsPresenter: ViewToPresenterGitHubRepositoryDetailsProtocol {
  
    
    var gitHubRepositoryDetailsInteractor: PresenterToInteractorGitHubRepositoryDetailsProtocol?
    
    var gitHubRepositoryDetailsView: PresenterToViewGitHubRepositoryDetailsProtocol?
    
    var gitHubRepositoryDetails: GitHubRepositoryToView?
    
    func shareGitHubRepositoryUrl() {
        gitHubRepositoryDetailsInteractor?.shareGitHubrepositoryUrl(gitHubRepositoryDetails: gitHubRepositoryDetails!)
    }
    
    func openGitHubRepositoryWebsiteOnSafari() {
        gitHubRepositoryDetailsInteractor?.openGitHubrepositoryWebsiteOnSafari(gitHubRepositoryDetails: gitHubRepositoryDetails!)
    }
}

extension GitHubRepositoryDetailsPresenter: InteractorToPresenterGitHubRepositoryDetailsProtocol {
 
    func sendDataFailed(error: String) {
        gitHubRepositoryDetailsView?.endGitHubRepositoryDetailsViewLoader()
        gitHubRepositoryDetailsView?.sendErrorToView(error: error)
    }

}
