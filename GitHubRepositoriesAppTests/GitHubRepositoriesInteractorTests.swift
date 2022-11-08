//
//  GitHubRepositoriesInteractorTests.swift
//  GitHubRepositoriesAppTests
//
//  Created by admin on 08/11/2022.
//

import XCTest
@testable import GitHubRepositoriesApp
@testable import GitHubRepositoriesNetworkClient
import CoreData

class GitHubRepositoriesInteractorTests: XCTestCase {

   // let implementaionUnderTest = GitHubRepositoriesInteractor()
    let networkClientMock = NetworkClientSpy<Any>()
    let repositoriesInteractorSpy = GitHubRepositoriesInteractorSpy()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repositoriesInteractorSpy.networkClient = networkClientMock
    }

    func testInit() {
        XCTAssertEqual(repositoriesInteractorSpy.page, 1)
        XCTAssertEqual(repositoriesInteractorSpy.repositoriesCountPerPage, 10)
    }
    
    func testGetGitHubRepositoriesPerPageWhenPageEqualsOneAndModeEqualsOriginal() {
        repositoriesInteractorSpy.page = 1
        repositoriesInteractorSpy.getGitHubRepositoriesPerPage(screenSearchMode: .originalMode)
        XCTAssertTrue(repositoriesInteractorSpy.invokedGetGitHubRepositoriesPerPage)
        XCTAssertTrue(networkClientMock.invokedResetCoreData)
        XCTAssertTrue(networkClientMock.invokedAllGitHubRepositroies)
    }
    
    func testGitHubRepositoriesPerPageWhenPageNotOneAndSearchModeEnable() {
        repositoriesInteractorSpy.page = 2
        repositoriesInteractorSpy.getGitHubRepositoriesPerPage(screenSearchMode: .searchMode)
        XCTAssertTrue(repositoriesInteractorSpy.invokedGetGitHubRepositoriesPerPage)
    }
    
    func testIfNetworkRequestGetAllGHRepositries() {
        repositoriesInteractorSpy.getAllGitHubRepositories()
        XCTAssertTrue(repositoriesInteractorSpy.invokedGetAllGitHubRepositories)
    }
    
    func testfunctionThatReturnDataRangePerPageWhenSearchModeIsOn() {
        repositoriesInteractorSpy.searchString = "test"
        repositoriesInteractorSpy.networkClient?.allGitHubRepositroies(searchString: repositoriesInteractorSpy.searchString)
        XCTAssertTrue(((repositoriesInteractorSpy.networkClient?.invokedAllGitHubRepositroies) != nil))
        repositoriesInteractorSpy.getGitHubRepositoriesPerPage(screenSearchMode: .searchMode)
        XCTAssertTrue(repositoriesInteractorSpy.invokedGetGitHubRepositoriesSavedInCoreDataPerPage)
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
