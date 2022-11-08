//
//  GitHubRepositoryListPresenter.swift
//  GitHubRepositoriesAppTests
//
//  Created by Passant Abdelatif on 08/11/2022.
//

import XCTest
@testable import GitHubRepositoriesApp

class GitHubRepositoriesListPresenter: ViewToPresenterGitHubRepositoriesProtocol {

    var stubbedGitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol!

    var gitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol? {
        get {
            return stubbedGitHubRepositoriesInteractor
        }
        set {}
    }

    var stubbedGitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol!

    var gitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol? {
        get {
            return stubbedGitHubRepositoriesView
        }
        set {}
    }

    var stubbedPage: Int! = 0

    var page: Int {
        get {
            return stubbedPage
        }
        set {}
    }

    var stubbedRepositoriesCountPerPage: Int! = 0

    var repositoriesCountPerPage: Int {
        get {
            return stubbedRepositoriesCountPerPage
        }
        set {}
    }

    var stubbedHasNext: Bool!

    var hasNext: Bool? {
        get {
            return stubbedHasNext
        }
        set {}
    }

    var stubbedSearchString: String!

    var searchString: String? {
        get {
            return stubbedSearchString
        }
        set {}
    }

    var stubbedScreenSearchMode: GitHubRepositoriesSearchViewMode!

    var screenSearchMode: GitHubRepositoriesSearchViewMode? {
        get {
            return stubbedScreenSearchMode
        }
        set {}
    }

    func getGitHubRepositoriesPerPage() {
        
    }
}
