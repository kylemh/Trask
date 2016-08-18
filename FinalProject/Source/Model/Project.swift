//
//  Project.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/8/16.
//

import Foundation
import CoreData
import CoreDataService

class Project: NSManagedObject, NamedEntity {
    
    static var entityName: String {
        return "Project"
    }
    
}
