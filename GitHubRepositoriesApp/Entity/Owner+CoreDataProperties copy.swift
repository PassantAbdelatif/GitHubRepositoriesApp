//
//  Owner+CoreDataProperties.swift
//  
//
//  Created by Passant Abdelatif on 08/11/2022.
//
//

import Foundation
import CoreData


extension Owner {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Owner> {
        return NSFetchRequest<Owner>(entityName: "Owner")
    }

    @NSManaged public var login: String?
    @NSManaged public var avatarUrl: String?

}
