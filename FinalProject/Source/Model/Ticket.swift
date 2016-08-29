//
//  Ticket.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/29/16.
//
//

import Foundation
import CoreData


class Ticket: NSManagedObject, NamedEntity {
    //Properties (NamedEntity)
    static var entityName: String {
        return "Ticket"
    }
}
