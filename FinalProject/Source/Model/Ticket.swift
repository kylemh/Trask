//
//  Ticket.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/8/16.
//

import Foundation
import CoreData
import CoreDataService

class Ticket: Column {
    //static var entityName: String {
    //    return "Ticket"
    //}
    
    @NSManaged var ticketAssignee: String?
    @NSManaged var ticketComments: String?
    @NSManaged var ticketCreationDate: NSDate
    @NSManaged var ticketDetail: String?
    @NSManaged var ticketLabel: String?
    @NSManaged var ticketMilestone: NSDate?
    @NSManaged var ticketNumber: NSNumber
    @NSManaged var ticketTitle: String
    
    @NSManaged var parentColumn: Column
}
