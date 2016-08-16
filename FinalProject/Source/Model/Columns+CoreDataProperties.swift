//
//  Columns+CoreDataProperties.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/8/16.
//

import Foundation
import CoreData

extension Columns {

    @NSManaged var columnName: String?
    @NSManaged var columnTicketCount: NSNumber?
    @NSManaged var childTicket: NSSet?
    @NSManaged var parentProject: Project?

}
