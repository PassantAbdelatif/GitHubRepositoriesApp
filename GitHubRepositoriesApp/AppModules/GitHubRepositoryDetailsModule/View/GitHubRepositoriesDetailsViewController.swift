//
//  GitHubRepositoriesDetailsViewController.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 05/11/2022.
//

import UIKit

class GitHubRepositoriesDetailsViewController: BaseViewController {

    
    @IBOutlet weak var gitHubRepositoryDescriptionLabel: UILabel!
    @IBOutlet weak var gitHubRepositoryImageView: UIImageView!
    @IBOutlet weak var gitHubRepositoryNamesLabel: UILabel!
    
    
    var gitHubRepositoriesDetailsPresenter: ViewToPresenterGitHubRepositoryDetailsProtocol?
    var spinner: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpData()
    }
   
}

extension GitHubRepositoriesDetailsViewController {
    @IBAction func goToRecipeWebSiteAction(_ sender: Any) {
        gitHubRepositoriesDetailsPresenter?.openGitHubRepositoryWebsiteOnSafari()
    }
    
    @objc func shareButtonPressed() {
        gitHubRepositoriesDetailsPresenter?.shareGitHubRepositoryUrl()
       
    }
}
extension GitHubRepositoriesDetailsViewController {
    func setUpUI() {
        self.title = Constants.ScreenTitles.repositoriesDetailsScreen
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action,
                                          target: self,
                                          action: #selector(shareButtonPressed))
        
        self.navigationItem.rightBarButtonItem = shareButton
    }
   
    func setUpData() {
        guard let repository = gitHubRepositoriesDetailsPresenter?.gitHubRepositoryDetails else {
            return
        }
        self.gitHubRepositoryDescriptionLabel.text = repository.repositoryDescription ?? ""
        self.gitHubRepositoryImageView.loadImageUsingCache(withUrl: (repository.owner?.avatarUrl)!)
        self.gitHubRepositoryNamesLabel.text = repository.name ?? ""
      
    }
   
}

extension GitHubRepositoriesDetailsViewController: PresenterToViewGitHubRepositoryDetailsProtocol {
    func startGitHubRepositoryDetailsViewLoader() {
      
    }
    
    func endGitHubRepositoryDetailsViewLoader() {
     
    }
      
    func sendErrorToView(error: String) {
        self.showAlert(title: "Error", message: error)
    }
}

