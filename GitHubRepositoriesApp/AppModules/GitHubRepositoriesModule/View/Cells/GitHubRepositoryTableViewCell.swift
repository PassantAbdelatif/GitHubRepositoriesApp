//
//  RecipeTableViewCell.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import UIKit
class GitHubRepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var githubRepositryOwnerImageView: UIImageView!
    @IBOutlet weak var githubRepositryNameLabel: UILabel!
    @IBOutlet weak var githubRepositryOwnerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        self.mainContainerView.layer.cornerRadius = 20
        self.mainContainerView.addPrimaryShadow()
    }

    func configureCell(githubRepositry: GithubRepositry) {
        
        if let owner = githubRepositry.owner,
           let ownerAvatartUrl = owner.avatarUrl,
           !ownerAvatartUrl.isEmpty {
            
            self.githubRepositryOwnerImageView.loadImageFromUrl(ownerAvatartUrl)
        } else {
            self.githubRepositryOwnerImageView.image = UIImage(named: "ic_avater_image")
        }
        
        self.githubRepositryNameLabel.text = githubRepositry.name ?? ""
        self.githubRepositryOwnerNameLabel.text = githubRepositry.owner?.login ?? ""
    }
}
