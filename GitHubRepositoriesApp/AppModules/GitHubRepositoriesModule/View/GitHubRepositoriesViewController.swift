//
//  RecipeSearchVC.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import Foundation
import UIKit
import CoreData
enum GitHubRepositoriesSearchViewMode {
    case originalMode
    case searchMode
}

class GitHubRepositoriesViewController: BaseViewController {
    // MARK: Outlets
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var githubRepositoriesListTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
   
    // MARK: Properties
    var gitHubRepositoriesList: [GitHubRepositoryToView] = [GitHubRepositoryToView]()
    var gitHubRepositoriesPresenter: ViewToPresenterGitHubRepositoriesProtocol?
    var spinner: UIActivityIndicatorView?
    lazy var emptyView : EmptyView = {
        return EmptyView()
    }()
    
    // MARK: UIView Lifecycle
    override func viewDidLoad() {
        setUpUI()
        registerCells()
        
        GitHubRepositoriesRouter.createModule(gitHubRepositoriesViewController: self)
        getGitHubRepositories()
        
    }
}
// MARK: Actions
extension GitHubRepositoriesViewController {
    @IBAction func searchButtonAction(_ sender: Any) {
        
    }
    @objc private func textDidChange(sender: UITextField) {
        if let searchText = self.searchTextField.text,
           searchText.count >= 2 {
            gitHubRepositoriesPresenter?.searchString = searchText
            gitHubRepositoriesPresenter?.repositoriesToSearchIn = self.gitHubRepositoriesList
            gitHubRepositoriesPresenter?.screenSearchMode = .searchMode
            updateListStatus = .refresh
            gitHubRepositoriesPresenter?.getGitHubRepositoriesPerPage()
        }
    }

}
// MARK: Get GitHub Repositories
extension GitHubRepositoriesViewController {
    func getGitHubRepositories()  {
        gitHubRepositoriesPresenter?.page = 1
        gitHubRepositoriesPresenter?.repositoriesCountPerPage = 10
        updateListStatus = .refresh
        gitHubRepositoriesPresenter?.screenSearchMode = .originalMode
        
        gitHubRepositoriesPresenter?.getGitHubRepositoriesPerPage()
        
    }
}
// MARK: SetUpUI & Register Cells
extension GitHubRepositoriesViewController {
    func setUpUI() {
        self.title = Constants.ScreenTitles.repositoriesSearchScreen
        self.searchTextField.addTarget(self,
                                       action: #selector(textDidChange(sender:)),
                                       for: .editingChanged)
        self.searchView.addPrimaryShadow()
        if #available(iOS 13.0, *) {
            spinner = UIActivityIndicatorView(style: .medium)
        } else {
            // Fallback on earlier versions
        }
        spinner?.hidesWhenStopped = true
        
        self.githubRepositoriesListTableView.setupLoadingMore {
            self.updateListStatus = .loadMore
            if let hasNext = self.gitHubRepositoriesPresenter?.hasNext,
               hasNext {
                self.gitHubRepositoriesPresenter?.page += 1
                self.gitHubRepositoriesPresenter?.getGitHubRepositoriesPerPage()
            } else {
                DispatchQueue.main.async() {
                    self.githubRepositoriesListTableView.endLoadingMoreAndRefreshing()
                }
            }
            
        }
        self.githubRepositoriesListTableView.setupRefresh {
            self.getGitHubRepositories()
        }
    }
    
    func registerCells() {
        githubRepositoriesListTableView.delegate = self
        githubRepositoriesListTableView.dataSource = self
        //GitHubRepositoryTableViewCell
        githubRepositoriesListTableView.registerNibFor(cellClass: GitHubRepositoryTableViewCell.self)
        // Set automatic dimensions for row height
        githubRepositoriesListTableView.rowHeight = UITableView.automaticDimension
        githubRepositoriesListTableView.estimatedRowHeight = UITableView.automaticDimension
        
        self.searchTextField.delegate = self

    }
}
// MARK: GetData
extension GitHubRepositoriesViewController: PresenterToViewGitHubRepositoriesProtocol {
    func sendGitHubRepositoriesToView(gitHubRepositories: [GitHubRepositoryToView]) {
        switch self.updateListStatus {
        case .refresh:
            
            self.gitHubRepositoriesList.removeAll()
            self.gitHubRepositoriesList = gitHubRepositories
            
        case .loadMore:
            self.gitHubRepositoriesList.append(contentsOf: gitHubRepositories)
        }
        DispatchQueue.main.async() {
            self.githubRepositoriesListTableView.reloadData(isEmpty:  self.gitHubRepositoriesList.isEmpty,
                                             noDataView: self.emptyView)
            self.githubRepositoriesListTableView.endLoadingMoreAndRefreshing()
        }
    }
    
    func sendFilteredGitHubRepositoriesToView(gitHubRepositories: [GitHubRepositoryToView]) {
        
    }
    

    func startViewLoader() {
        spinner?.startAnimating()
        githubRepositoriesListTableView.backgroundView = spinner
    }
    
    func endViewLoader() {
        DispatchQueue.main.async() {
            self.spinner?.stopAnimating()
            self.spinner?.hidesWhenStopped = true
            self.githubRepositoriesListTableView.backgroundView = nil
        }
       
    }
    
    func sendErrorToView(error: String) {
        DispatchQueue.main.async() {
            
            self.spinner?.stopAnimating()
            self.spinner?.hidesWhenStopped = true
            self.githubRepositoriesListTableView.backgroundView = nil
            if self.updateListStatus == .refresh {
                self.gitHubRepositoriesList.removeAll()
                self.githubRepositoriesListTableView.reloadData()
            }
            self.githubRepositoriesListTableView.endLoadingMoreAndRefreshing()
            let alert = UIAlertController(title: "Error",
                                          message: error,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self.present(alert,
                         animated: true,
                         completion: nil)
        }
    }
    
}

// MARK: UITableViewDataSource
extension GitHubRepositoriesViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return gitHubRepositoriesList.count
        
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(cellClass: GitHubRepositoryTableViewCell.self)
        if gitHubRepositoriesList.count > 0 {
            cell.configureCell(githubRepositry: gitHubRepositoriesList[indexPath.row])
        }
        return cell
        
    }
    
}
// MARK: UITableViewDelegate
extension GitHubRepositoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


// MARK: UITextFieldDelegate
extension GitHubRepositoriesViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if string.isStringContainsEnglishCharactersAndSpaces {
            return false
        }
        let newString = (textField.text! as NSString).replacingCharacters(in: range,
                                                                          with: string) as NSString
        let spacesCondition = newString.isStartWithWhitespace
        return spacesCondition
    }
}
