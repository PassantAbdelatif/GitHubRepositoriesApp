//
//  GitHubRepository+CoreDataProperties.swift
//  
//
//  Created by Passant Abdelatif on 08/11/2022.
//
//

import Foundation
import CoreData


extension GitHubRepository {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GitHubRepository> {
        return NSFetchRequest<GitHubRepository>(entityName: "GitHubRepository")
    }

    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var repositoryDescription: String?
    @NSManaged public var owner: Owner?
    @NSManaged public var repositoryId: Int32

}
