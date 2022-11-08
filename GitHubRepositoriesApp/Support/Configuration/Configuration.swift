//
//  Configuration.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import Foundation

public enum Configuration {
    
    static var baseURL: String = "https://api.github.com"
        
    
    static let API_GITHUB_REPOSITORIES_LIST = "/repositories"
}

enum UserDefaultsKeys: String {
    case searchKeys = "searchKeys"
}
