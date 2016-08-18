//
//  Column+CoreDataProperties.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/8/16.
//

import Foundation
import CoreData
import CoreDataService

extension Column {

    @NSManaged var columnName: String
    @NSManaged var columnTicketCount: NSNumber
    @NSManaged var columnIndex: NSNumber
    
    @NSManaged var childTicket: NSSet?
    @NSManaged var parentProject: Project

}
