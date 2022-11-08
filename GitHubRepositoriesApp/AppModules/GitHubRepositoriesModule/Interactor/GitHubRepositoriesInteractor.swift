//
//  GitHubRepositoriesInteractor.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import Foundation
import GitHubRepositoriesNetworkClient
import CoreData
class GitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol {
    var page: Int = 1
    
    var repositoriesCountPerPage: Int = 10

    var presenter: InteractorToPresenterGitHubRepositoriesProtocol?
    
    func getGitHubRepositoriesSearchResult(gitHubRepositoriesToFilter: [GitHubRepository],
                                           searchString: String) {
        
    }
    func getGitHubRepositoriesPerPage(screenSearchMode: GitHubRepositoriesSearchViewMode) {
        if page == 1 && screenSearchMode == .originalMode {
            //first time to get your data from network
            //or user make pull to refresh with out making any search
            //you have to clear your coredata
            NetworkDataManager.shared.deleteAllRecords(entity: GitHubRepository.self)
            NetworkDataManager.shared.deleteAllRecords(entity: Owner.self)
            getAllGitHubRepositories()
        } else {
            getGitHubRepositoriesSavedInCoreDataPerPage()
        }
    }
    
    func getAllGitHubRepositories() {
        if let requestUrl = URL(string: "\(Configuration.baseURL)\(Configuration.API_GITHUB_REPOSITORIES_LIST)") {
            
            NetworkClient.shared.get(requestUrl) { (result: Result<[GitHubRepository],
                                                    Error>) in
                
                switch result {
                case .success(_):
      
                    self.getGitHubRepositoriesSavedInCoreDataPerPage()

                case .failure(let error):
                    if let networkError = error as? NetworkError {
                        self.presenter?.sendDataFailed(error: networkError.message ?? networkError.error ?? "")
                    } else {
                        self.presenter?.sendDataFailed(error: error.localizedDescription)
                    }
                }
            }
        }
    }

    
    func getGitHubRepositoriesSavedInCoreDataPerPage() {
        var gitHubRepositoriesPerPage: [GitHubRepositoryToView] = [GitHubRepositoryToView]()
        if let allGitHubRepositories: [NSManagedObject] = NetworkClient.shared.allGitHubRepositroies() {
           
            let EndRange = (page * repositoriesCountPerPage)
            var startRange = EndRange - repositoriesCountPerPage
            if page == 1 {
                startRange = 0
            }
            
            for gitHubRepository in allGitHubRepositories {
                if let owner = gitHubRepository.value(forKey: "owner") as? NSManagedObject {
                    let ownerToView = OwnerToView(name: owner.value(forKey: "login") as? String,
                                                  avatarUrl: owner.value(forKey: "avatarUrl") as? String)
                    let giHubRepositoryToView = GitHubRepositoryToView(name: gitHubRepository.value(forKey: "name") as? String,
                                                                       owner: ownerToView)
                    gitHubRepositoriesPerPage.append(giHubRepositoryToView)
                }
               
            }
            if EndRange <= allGitHubRepositories.count {
                gitHubRepositoriesPerPage = gitHubRepositoriesPerPage[range: startRange..<EndRange]
            }
            
            self.presenter?.sendGitHubRepositoriesToPresenter(gitHubRepositories: gitHubRepositoriesPerPage,
                                                              hasNextPage: gitHubRepositoriesPerPage.count < allGitHubRepositories.count)
        }
    }
}

