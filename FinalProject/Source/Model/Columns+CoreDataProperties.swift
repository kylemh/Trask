//
//  Column+CoreDataProperties.swift
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

extension Column {

    @NSManaged var columnName: String
    @NSManaged var columnTicketCount: NSNumber
    @NSManaged var columnIndex: NSNumber
    
    @NSManaged var childTicket: NSSet?
    @NSManaged var parentProject: Project

}
