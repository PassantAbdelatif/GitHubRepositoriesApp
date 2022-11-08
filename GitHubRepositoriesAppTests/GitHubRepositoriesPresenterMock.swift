//
//  GitHubRepositoriesPresenterMock.swift
//  GitHubRepositoriesAppTests
//
//  Created by Passant Abdelatif on 08/11/2022.
//

import Foundation
import XCTest
@testable import GitHubRepositoriesApp

class GitHubReposotriesListPeresnter: ViewToPresenterGitHubRepositoriesProtocol {

    var invokedGitHubRepositoriesInteractorSetter = false
    var invokedGitHubRepositoriesInteractorSetterCount = 0
    var invokedGitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol?
    var invokedGitHubRepositoriesInteractorList = [PresenterToInteractorGitHubRepositoriesProtocol?]()
    var invokedGitHubRepositoriesInteractorGetter = false
    var invokedGitHubRepositoriesInteractorGetterCount = 0
    var stubbedGitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol!

    var gitHubRepositoriesInteractor: PresenterToInteractorGitHubRepositoriesProtocol? {
        set {
            invokedGitHubRepositoriesInteractorSetter = true
            invokedGitHubRepositoriesInteractorSetterCount += 1
            invokedGitHubRepositoriesInteractor = newValue
            invokedGitHubRepositoriesInteractorList.append(newValue)
        }
        get {
            invokedGitHubRepositoriesInteractorGetter = true
            invokedGitHubRepositoriesInteractorGetterCount += 1
            return stubbedGitHubRepositoriesInteractor
        }
    }

    var invokedGitHubRepositoriesViewSetter = false
    var invokedGitHubRepositoriesViewSetterCount = 0
    var invokedGitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol?
    var invokedGitHubRepositoriesViewList = [PresenterToViewGitHubRepositoriesProtocol?]()
    var invokedGitHubRepositoriesViewGetter = false
    var invokedGitHubRepositoriesViewGetterCount = 0
    var stubbedGitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol!

    var gitHubRepositoriesView: PresenterToViewGitHubRepositoriesProtocol? {
        set {
            invokedGitHubRepositoriesViewSetter = true
            invokedGitHubRepositoriesViewSetterCount += 1
            invokedGitHubRepositoriesView = newValue
            invokedGitHubRepositoriesViewList.append(newValue)
        }
        get {
            invokedGitHubRepositoriesViewGetter = true
            invokedGitHubRepositoriesViewGetterCount += 1
            return stubbedGitHubRepositoriesView
        }
    }

    var invokedPageSetter = false
    var invokedPageSetterCount = 0
    var invokedPage: Int?
    var invokedPageList = [Int]()
    var invokedPageGetter = false
    var invokedPageGetterCount = 0
    var stubbedPage: Int! = 0

    var page: Int {
        set {
            invokedPageSetter = true
            invokedPageSetterCount += 1
            invokedPage = newValue
            invokedPageList.append(newValue)
        }
        get {
            invokedPageGetter = true
            invokedPageGetterCount += 1
            return stubbedPage
        }
    }

    var invokedRepositoriesCountPerPageSetter = false
    var invokedRepositoriesCountPerPageSetterCount = 0
    var invokedRepositoriesCountPerPage: Int?
    var invokedRepositoriesCountPerPageList = [Int]()
    var invokedRepositoriesCountPerPageGetter = false
    var invokedRepositoriesCountPerPageGetterCount = 0
    var stubbedRepositoriesCountPerPage: Int! = 0

    var repositoriesCountPerPage: Int {
        set {
            invokedRepositoriesCountPerPageSetter = true
            invokedRepositoriesCountPerPageSetterCount += 1
            invokedRepositoriesCountPerPage = newValue
            invokedRepositoriesCountPerPageList.append(newValue)
        }
        get {
            invokedRepositoriesCountPerPageGetter = true
            invokedRepositoriesCountPerPageGetterCount += 1
            return stubbedRepositoriesCountPerPage
        }
    }

    var invokedHasNextSetter = false
    var invokedHasNextSetterCount = 0
    var invokedHasNext: Bool?
    var invokedHasNextList = [Bool?]()
    var invokedHasNextGetter = false
    var invokedHasNextGetterCount = 0
    var stubbedHasNext: Bool!

    var hasNext: Bool? {
        set {
            invokedHasNextSetter = true
            invokedHasNextSetterCount += 1
            invokedHasNext = newValue
            invokedHasNextList.append(newValue)
        }
        get {
            invokedHasNextGetter = true
            invokedHasNextGetterCount += 1
            return stubbedHasNext
        }
    }

    var invokedSearchStringSetter = false
    var invokedSearchStringSetterCount = 0
    var invokedSearchString: String?
    var invokedSearchStringList = [String?]()
    var invokedSearchStringGetter = false
    var invokedSearchStringGetterCount = 0
    var stubbedSearchString: String!

    var searchString: String? {
        set {
            invokedSearchStringSetter = true
            invokedSearchStringSetterCount += 1
            invokedSearchString = newValue
            invokedSearchStringList.append(newValue)
        }
        get {
            invokedSearchStringGetter = true
            invokedSearchStringGetterCount += 1
            return stubbedSearchString
        }
    }

    var invokedScreenSearchModeSetter = false
    var invokedScreenSearchModeSetterCount = 0
    var invokedScreenSearchMode: GitHubRepositoriesSearchViewMode?
    var invokedScreenSearchModeList = [GitHubRepositoriesSearchViewMode?]()
    var invokedScreenSearchModeGetter = false
    var invokedScreenSearchModeGetterCount = 0
    var stubbedScreenSearchMode: GitHubRepositoriesSearchViewMode!

    var screenSearchMode: GitHubRepositoriesSearchViewMode? {
        set {
            invokedScreenSearchModeSetter = true
            invokedScreenSearchModeSetterCount += 1
            invokedScreenSearchMode = newValue
            invokedScreenSearchModeList.append(newValue)
        }
        get {
            invokedScreenSearchModeGetter = true
            invokedScreenSearchModeGetterCount += 1
            return stubbedScreenSearchMode
        }
    }

    var invokedGetGitHubRepositoriesPerPage = false
    var invokedGetGitHubRepositoriesPerPageCount = 0

    func getGitHubRepositoriesPerPage() {
        invokedGetGitHubRepositoriesPerPage = true
        invokedGetGitHubRepositoriesPerPageCount += 1
    }
}
