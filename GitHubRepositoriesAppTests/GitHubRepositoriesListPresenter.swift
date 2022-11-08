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
        set {}
        get {
            return stubbedGitHubRepositoriesInteractor
        }
    }

    var stubbedGitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol!

    var gitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol? {
        set {}
        get {
            return stubbedGitHubRepositoriesView
        }
    }

    var stubbedPage: Int! = 0

    var page: Int {
        set {}
        get {
            return stubbedPage
        }
    }

    var stubbedRepositoriesCountPerPage: Int! = 0

    var repositoriesCountPerPage: Int {
        set {}
        get {
            return stubbedRepositoriesCountPerPage
        }
    }

    var stubbedHasNext: Bool!

    var hasNext: Bool? {
        set {}
        get {
            return stubbedHasNext
        }
    }

    var stubbedSearchString: String!

    var searchString: String? {
        set {}
        get {
            return stubbedSearchString
        }
    }

    var stubbedScreenSearchMode: GitHubRepositoriesSearchViewMode!

    var screenSearchMode: GitHubRepositoriesSearchViewMode? {
        set {}
        get {
            return stubbedScreenSearchMode
        }
    }

    func getGitHubRepositoriesPerPage() {}
}
