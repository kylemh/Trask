//
//  Project+CoreDataProperties.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/8/16.
//

import Foundation
import CoreData
import CoreDataService

extension Project {

    @NSManaged var projectColorMain: NSObject
    @NSManaged var projectColorSecondary: NSObject
    @NSManaged var projectColumnCount: NSNumber
    @NSManaged var projectName: String
    @NSManaged var projectNotifications: NSNumber
    @NSManaged var projectCreationDate: NSDate
    @NSManaged var projectTicketCount: NSNumber
    
    @NSManaged var childColumn: NSSet

}
