//
//  Project+CoreDataProperties.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/18/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Project {

    @NSManaged var projectColorMain: NSObject
    @NSManaged var projectColorSecondary: NSObject
    @NSManaged var projectName: String
    @NSManaged var projectNotifications: NSNumber
    @NSManaged var projectCreationDate: NSDate
    @NSManaged var projectTicketCount: NSNumber
    
    @NSManaged var childColumn: NSSet

}
