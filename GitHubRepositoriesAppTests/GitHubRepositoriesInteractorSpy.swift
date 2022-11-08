//
//  GitHubRepositoriesInteractorSpy.swift
//  GitHubRepositoriesAppTests
//
//  Created by Passant Abdelatif on 08/11/2022.
//

import Foundation
@testable import GitHubRepositoriesApp
@testable import GitHubRepositoriesNetworkClient
import CoreData
class GitHubRepositoriesInteractorSpy: PresenterToInteractorGitHubRepositoriesProtocol {

    var invokedPresenterSetter = false
    var invokedPresenterSetterCount = 0
    var invokedPresenter: InteractorToPresenterGitHubRepositoriesProtocol?
    var invokedPresenterList = [InteractorToPresenterGitHubRepositoriesProtocol?]()
    var invokedPresenterGetter = false
    var invokedPresenterGetterCount = 0
    var stubbedPresenter: InteractorToPresenterGitHubRepositoriesProtocol!

    var networkClient: NetworkClient?
    var presenter: InteractorToPresenterGitHubRepositoriesProtocol? {
        set {
            invokedPresenterSetter = true
            invokedPresenterSetterCount += 1
            invokedPresenter = newValue
            invokedPresenterList.append(newValue)
        }
        get {
            invokedPresenterGetter = true
            invokedPresenterGetterCount += 1
            return stubbedPresenter
        }
    }

    var invokedPage: Int?
    var stubbedPage: Int! = 1

    var page: Int {
        set {
            invokedPage = newValue
        }
        get {
            return stubbedPage
        }
    }

    var invokedRepositoriesCountPerPage: Int?
    var stubbedRepositoriesCountPerPage: Int! = 10

    var repositoriesCountPerPage: Int {
        set {
            invokedRepositoriesCountPerPage = newValue
        }
        get {
            return stubbedRepositoriesCountPerPage
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

    var invokedGetGitHubRepositoriesPerPage = false
    var invokedGetGitHubRepositoriesPerPageCount = 0
    var invokedGetGitHubRepositoriesPerPageParameters: (screenSearchMode: GitHubRepositoriesSearchViewMode, Void)?
    var invokedGetGitHubRepositoriesPerPageParametersList = [(screenSearchMode: GitHubRepositoriesSearchViewMode, Void)]()

    func getGitHubRepositoriesPerPage(screenSearchMode: GitHubRepositoriesSearchViewMode) {
        invokedGetGitHubRepositoriesPerPage = true
        if (page == 1 && screenSearchMode == GitHubRepositoriesSearchViewMode.originalMode ) {
            networkClient?.resetCoreData()
            networkClient?.allGitHubRepositroies()
        }
        invokedGetGitHubRepositoriesPerPageCount += 1
        invokedGetGitHubRepositoriesPerPageParameters = (screenSearchMode, ())
        invokedGetGitHubRepositoriesPerPageParametersList.append((screenSearchMode, ()))
    }
}

class NetworkClientSpy<T>: NetworkClient {

    var invokedGet = false
    var invokedGetCount = 0
    var invokedGetParameters: (url: URL, Void)?
    var invokedGetParametersList = [(url: URL, Void)]()
    var stubbedGetCompletionHandlerResult: (Result<[T], Error>, Void)?

    override func get<T>(_ url: URL, completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable {
        invokedGet = true
        invokedGetCount += 1
        invokedGetParameters = (url, ())
        invokedGetParametersList.append((url, ()))
      
    }

    var invokedPost = false
    var invokedPostCount = 0
    var invokedPostParameters: (url: URL, payload: Data?)?
    var invokedPostParametersList = [(url: URL, payload: Data?)]()
    var stubbedPostCompletionHandlerResult: (Result<[T], Error>, Void)?

    override func post<T>(_ url: URL, payload: Data?=nil, completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable {
        invokedPost = true
        invokedPostCount += 1
        invokedPostParameters = (url, payload)
        invokedPostParametersList.append((url, payload))
       
    }

    var invokedPut = false
    var invokedPutCount = 0
    var invokedPutParameters: (url: URL, payload: Data?)?
    var invokedPutParametersList = [(url: URL, payload: Data?)]()
    var stubbedPutCompletionHandlerResult: (Result<[T], Error>, Void)?

    override func put<T>(_ url: URL, payload: Data?=nil, completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable {
        invokedPut = true
        invokedPutCount += 1
        invokedPutParameters = (url, payload)
        invokedPutParametersList.append((url, payload))
        
    }

    var invokedDelete = false
    var invokedDeleteCount = 0
    var invokedDeleteParameters: (url: URL, Void)?
    var invokedDeleteParametersList = [(url: URL, Void)]()
    var stubbedDeleteCompletionHandlerResult: (Result<[T], Error>, Void)?

    override func delete<T>(_ url: URL, completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable {
        invokedDelete = true
        invokedDeleteCount += 1
        invokedDeleteParameters = (url, ())
        invokedDeleteParametersList.append((url, ()))
       
    }

    var invokedExecuteRequest = false
    var invokedExecuteRequestCount = 0
    var invokedExecuteRequestParameters: (url: URL, method: String, payload: Data?)?
    var invokedExecuteRequestParametersList = [(url: URL, method: String, payload: Data?)]()
    var stubbedExecuteRequestCompletionHandlerResult: (Result<[T], Error>, Void)?

    override func executeRequest<T>(_ url: URL,
        method: String,
        payload: Data?,
        completionHandler: @escaping (Result<[T], Error>) -> Void) where T: Codable {
        invokedExecuteRequest = true
        invokedExecuteRequestCount += 1
        invokedExecuteRequestParameters = (url, method, payload)
        invokedExecuteRequestParametersList.append((url, method, payload))
       
    }

    var invokedAllGitHubRepositroies = false
    var invokedAllGitHubRepositroiesCount = 0
    var invokedAllGitHubRepositroiesParameters: (searchString: String?, Void)?
    var invokedAllGitHubRepositroiesParametersList = [(searchString: String?, Void)]()
    var stubbedAllGitHubRepositroiesResult: [NSManagedObject]!

    override func allGitHubRepositroies(searchString: String? = nil) -> [NSManagedObject]? {
        invokedAllGitHubRepositroies = true
        invokedAllGitHubRepositroiesCount += 1
        invokedAllGitHubRepositroiesParameters = (searchString, ())
        invokedAllGitHubRepositroiesParametersList.append((searchString, ()))
        return stubbedAllGitHubRepositroiesResult
    }

    var invokedResetCoreData = false
    var invokedResetCoreDataCount = 0

    override func resetCoreData() {
        invokedResetCoreData = true
        invokedResetCoreDataCount += 1
    }
}
