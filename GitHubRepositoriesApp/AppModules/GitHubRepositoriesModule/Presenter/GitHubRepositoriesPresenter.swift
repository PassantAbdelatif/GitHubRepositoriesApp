//
//  GitHubRepositoriesPresenter.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import Foundation
class GitHubRepositoriesPresenter: ViewToPresenterGitHubRepositoriesProtocol {
   
    
    var gitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol?
    var gitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol?
    
    var page: Int?
    var hasNext: Bool?
    var repositoriesCountPerPage: Int?
    var searchString: String?
    var repositoriesToSearchIn: [GithubRepositry]?
    
    func getGitHubRepositoriesSearchResult() {
        
    }
    
    func getGitHubRepositoriesPerPage() {
        
    }
    

    
}

extension GitHubRepositoriesPresenter: InteractorToPresenterGitHubRepositoriesProtocol {
    func sendGitHubRepositoriesToPresenter(gitHubRepositories: [GithubRepositry],
                                           hasNextPage: Bool) {
        self.hasNext = hasNextPage
        self.gitHubRepositoriesView?.endViewLoader()
        self.gitHubRepositoriesView?.sendGitHubRepositoriesToView(gitHubRepositories: gitHubRepositories)
    }
    
    func sendFilteredGitHubRepositoriesToPresenter(gitHubRepositories: [GithubRepositry]) {
        self.gitHubRepositoriesView?.endViewLoader()
        self.gitHubRepositoriesView?.sendFilteredGitHubRepositoriesToView(gitHubRepositories: gitHubRepositories)
    }

    func sendDataFailed(error: String) {
        self.gitHubRepositoriesView?.endViewLoader()
        self.gitHubRepositoriesView?.sendErrorToView(error: error)
    }


}
