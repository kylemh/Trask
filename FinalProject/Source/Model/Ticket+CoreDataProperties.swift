//
//  Ticket+CoreDataProperties.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/29/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Ticket {

    //Optional Attributes
    @NSManaged var creationDate: NSDate
    @NSManaged var milestoneDate: NSDate
    @NSManaged var number: NSNumber
    @NSManaged var name: String
    
    //Non-Optional Attributes
    @NSManaged var assignee: String?
    @NSManaged var comments: String?
    @NSManaged var detailedInfo: String?
    @NSManaged var groupingLabel: String?
    
    //Relationships
    @NSManaged var parentColumn: NSManagedObject

}
