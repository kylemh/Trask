//
//  Ticket+CoreDataProperties.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/8/16.
//

import Foundation
import CoreData

extension Ticket {

    @NSManaged var ticketAssignee: String?
    @NSManaged var ticketComments: String?
    @NSManaged var ticketCreationDate: NSDate?
    @NSManaged var ticketDetail: String?
    @NSManaged var ticketLabel: String?
    @NSManaged var ticketMilestone: NSDate?
    @NSManaged var ticketNumber: NSNumber?
    @NSManaged var ticketTitle: String?
    @NSManaged var parentColumn: Columns?

}
