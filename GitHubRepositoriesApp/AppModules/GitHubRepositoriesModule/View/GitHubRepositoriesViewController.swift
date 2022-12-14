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
    var filteredGitHubRepositoriesList: [GitHubRepositoryToView] = [GitHubRepositoryToView]()
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
    @objc private func textDidChange(sender: UITextField) {
        if let searchText = self.searchTextField.text,
           searchText.count >= 2 {
            getFilteredGitHubRepositories()
        } else {
            gitHubRepositoriesPresenter?.searchString = nil
            gitHubRepositoriesPresenter?.screenSearchMode = .originalMode
            //when user start to delete search string
            //check current page
            if gitHubRepositoriesPresenter?.page ?? 1 > 1 {
                self.updateListStatus = .loadMore
            } else {
                self.updateListStatus = .refresh
            }
            self.githubRepositoriesListTableView.reloadData()
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
    
    func getFilteredGitHubRepositories() {
        gitHubRepositoriesPresenter?.searchString = self.searchTextField.text
        gitHubRepositoriesPresenter?.screenSearchMode = .searchMode
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
            switch gitHubRepositoriesPresenter?.screenSearchMode {
            case .originalMode:
                gitHubRepositoriesList.removeAll()
                gitHubRepositoriesList = gitHubRepositories
                refreshTableViewWithEmptyView(gitHubRepositories: gitHubRepositoriesList)
            case .searchMode:
                filteredGitHubRepositoriesList.removeAll()
                filteredGitHubRepositoriesList = gitHubRepositories
                refreshTableViewWithEmptyView(gitHubRepositories: filteredGitHubRepositoriesList)
            case .none:
                return
            }
         
        case .loadMore:
            switch gitHubRepositoriesPresenter?.screenSearchMode {
            case .originalMode:
                //when user in original mode without no search filter
                //the user get data within the page range
                //append data to exisiting items
                gitHubRepositoriesList.append(contentsOf: gitHubRepositories)
                refreshTableViewWithEmptyView(gitHubRepositories: gitHubRepositoriesList)
            case .searchMode:
                //when user type search to filter
                //the user get data filtered from 0 -> current page range
                //remove old data found and add fitlered data to screen
                filteredGitHubRepositoriesList.removeAll()
                filteredGitHubRepositoriesList = gitHubRepositories
                refreshTableViewWithEmptyView(gitHubRepositories: filteredGitHubRepositoriesList)
            case .none:
                return
            }
        }
    }
    
    func refreshTableViewWithEmptyView(gitHubRepositories: [GitHubRepositoryToView]) {
        DispatchQueue.main.async() {
            self.githubRepositoriesListTableView.reloadData(isEmpty:  gitHubRepositories.isEmpty,
                                             noDataView: self.emptyView)
            self.githubRepositoriesListTableView.endLoadingMoreAndRefreshing()
        }
    }

    func startViewLoader() {
        DispatchQueue.main.async() {
            self.spinner?.startAnimating()
            self.githubRepositoriesListTableView.backgroundView = self.spinner
        }
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
            self.showAlert(title: "Error", message: error)
        }
    }
}
// MARK: UITableViewDataSource
extension GitHubRepositoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        switch gitHubRepositoriesPresenter?.screenSearchMode {
        case .originalMode:
            return gitHubRepositoriesList.count
        case .searchMode:
            return filteredGitHubRepositoriesList.count
        default: break
        }
        return 0
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(cellClass: GitHubRepositoryTableViewCell.self)
        if gitHubRepositoriesList.count > 0 {
            switch gitHubRepositoriesPresenter?.screenSearchMode {
            case .originalMode:
                cell.configureCell(githubRepositry: gitHubRepositoriesList[indexPath.row])
            case .searchMode:
                cell.configureCell(githubRepositry: filteredGitHubRepositoriesList[indexPath.row])
            default: break
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch gitHubRepositoriesPresenter?.screenSearchMode {
        case .searchMode:
            GitHubRepositoriesRouter.pushToGitHubRepositoryDetialsScreen(gitHubRepository: filteredGitHubRepositoriesList[indexPath.row],
                                                                         navigationConroller: self.navigationController!)
        case .originalMode:
            GitHubRepositoriesRouter.pushToGitHubRepositoryDetialsScreen(gitHubRepository: gitHubRepositoriesList[indexPath.row],
                                                                         navigationConroller: self.navigationController!)
        default:
            break
        }
       
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
