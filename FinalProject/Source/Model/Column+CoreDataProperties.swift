//
//  Column+CoreDataProperties.swift
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

extension Column {

    //Attributes
    @NSManaged var index: NSNumber
    @NSManaged var name: String
    @NSManaged var ticketCount: NSNumber
    
    //Relationships
    @NSManaged var childTicket: NSSet?
    @NSManaged var parentProject: Project

}
