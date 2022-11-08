//
//  RecipeTableViewCell.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import UIKit
import GitHubRepositoriesNetworkClient
class GitHubRepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var githubRepositryOwnerImageView: UIImageView!
    @IBOutlet weak var githubRepositryNameLabel: UILabel!
    @IBOutlet weak var githubRepositryOwnerNameLabel: UILabel!
    @IBOutlet weak var repositoryDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        mainContainerView.layer.cornerRadius = 20
        mainContainerView.addPrimaryShadow()
    }

    func configureCell(githubRepositry: GitHubRepositoryToView) {
        githubRepositryOwnerImageView.image = UIImage(named: "ic_avater_image")
        githubRepositryOwnerImageView.loadImageUsingCache(withUrl: githubRepositry.owner?.avatarUrl ?? "")
        repositoryDateLabel.text = Date().dateFormatTimeToString(format: "EEEE, MMM d, yyyy") //​Thursday, Oct 22, 2020
        githubRepositryNameLabel.text = githubRepositry.name ?? ""
        githubRepositryOwnerNameLabel.text = githubRepositry.owner?.name ?? ""
    }
}
