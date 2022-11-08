//
//  GitHubRepositoriesAppTests.swift
//  GitHubRepositoriesAppTests
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import XCTest
@testable import GitHubRepositoriesApp


class GitHubRepositoriesListTests: XCTestCase {

    var presenter: GitHubReposotriesListPeresnter!
 
    override func setUp()  {
        self.presenter = GitHubReposotriesListPeresnter()
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
