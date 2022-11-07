//
//  GitHubRepositoriesInteractor.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import Foundation
class GitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol {
    
    var presenter: InteractorToPresenterGitHubRepositoriesProtocol?
    
    func getGitHubRepositoriesSearchResult(gitHubRepositoriesToFilter: [GithubRepositry],
                                           searchString: String) {
        
    }
    
    func getGitHubRepositoriesPerPage(page: Int,
                                      repositoriesCountPerPage: Int) {
        
    }

}

