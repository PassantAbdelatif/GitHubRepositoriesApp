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
    
    var page = 1
    var repositoriesCountPerPage: Int = 10
    var hasNext: Bool?
    var searchString: String?
    var screenSearchMode: GitHubRepositoriesSearchViewMode?
    
    init() {
        
    }
  
    func getGitHubRepositoriesPerPage() {
        gitHubRepositoriesInteractor?.page = page
        gitHubRepositoriesInteractor?.repositoriesCountPerPage = 10
        gitHubRepositoriesInteractor?.searchString = searchString
        gitHubRepositoriesInteractor?.getGitHubRepositoriesPerPage(screenSearchMode: screenSearchMode ?? .originalMode)
    }
    

    
}

extension GitHubRepositoriesPresenter: InteractorToPresenterGitHubRepositoriesProtocol {
    func sendGitHubRepositoriesToPresenter(gitHubRepositories: [GitHubRepositoryToView],
                                           hasNextPage: Bool) {
        self.hasNext = hasNextPage
        self.gitHubRepositoriesView?.startViewLoader()
        self.gitHubRepositoriesView?.sendGitHubRepositoriesToView(gitHubRepositories: gitHubRepositories)
    }
    func sendDataFailed(error: String) {
        self.gitHubRepositoriesView?.endViewLoader()
        self.gitHubRepositoriesView?.sendErrorToView(error: error)
    }


}
