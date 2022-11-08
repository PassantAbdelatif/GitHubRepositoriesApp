//
//  GitHubRepositoriesListTest.swift
//  GitHubRepositoriesAppTests
//
//  Created by Passant Abdelatif on 08/11/2022.
//

import XCTest
@testable import GitHubRepositoriesApp


class GitHubRepositoriesListTest: XCTestCase {

    var sut: GitHubRepositoriesViewController!
    
    var presenter: GitHubRepositoriesListPresenter!
 
    override func setUp()  {
        self.presenter = GitHubRepositoriesListPresenter()
    }

    override func tearDown()  {
        self.presenter = nil
    }


    func testCreateGitHubRepositoryCreateModule () {
        let viewController = GitHubRepositoriesViewController()
        GitHubRepositoriesRouter.createModule(gitHubRepositoriesViewController: viewController)
        XCTAssertTrue(viewController.gitHubRepositoriesPresenter is GitHubRepositoriesPresenter)
        XCTAssertTrue(viewController.gitHubRepositoriesPresenter?.gitHubRepositoriesInteractor is GitHubRepositoriesInteractor)
        XCTAssertEqual(viewController.gitHubRepositoriesPresenter?.gitHubRepositoriesView as! GitHubRepositoriesViewController , viewController)
        guard let presenter = viewController.gitHubRepositoriesPresenter?.gitHubRepositoriesInteractor?.presenter as? GitHubRepositoriesPresenter else {
            fatalError()
        }
        XCTAssertTrue(presenter === (viewController.gitHubRepositoriesPresenter as! GitHubRepositoriesPresenter))
    }
    

    
   
}
