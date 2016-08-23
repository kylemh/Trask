//
//  Ticket+CoreDataProperties.swift
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

extension Ticket {

    @NSManaged var ticketAssignee: String?
    @NSManaged var ticketComments: String?
    @NSManaged var ticketCreationDate: NSDate
    @NSManaged var ticketDetail: String?
    @NSManaged var ticketLabel: String?
    @NSManaged var ticketMilestone: NSDate
    @NSManaged var ticketNumber: NSNumber
    @NSManaged var ticketTitle: String
    
    @NSManaged var parentColumn: Column

}
