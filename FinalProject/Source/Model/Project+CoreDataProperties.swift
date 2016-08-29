//
//  Project+CoreDataProperties.swift
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

extension Project {

    //Attributes
    @NSManaged var name: String
    @NSManaged var index: NSNumber
    @NSManaged var notificationsBool: NSNumber
    @NSManaged var mainColor: String
    @NSManaged var textColor: String
    @NSManaged var creationDate: NSDate
    @NSManaged var ticketCount: NSNumber
    
    //Relationships
    @NSManaged var childColumn: NSSet

}
