//
//  Project.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/18/16.
//
//

import Foundation
import CoreData


class Project: NSManagedObject, NamedEntity {
    static var entityName: String {
        return "Project"
    }
}
