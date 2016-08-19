//
//  TraskService.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/18/16.
//
//

import CoreData
import CoreDataService
import Foundation

class TraskService {
    //Projects Fetch
    func fetchedResultsControllerForProjectList() throws -> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(namedEntity: Project.self)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "projectCreationDate", ascending: true)]
        fetchRequest.fetchBatchSize = 10 //not the maximum - optimization of fetch request given many items
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        try resultsController.performFetch()
        
        return resultsController
    }
    
    //Columns Fetch
    func fetchedResultsControllerForColumnsInProject(project: Project) throws -> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(namedEntity: Project.self)
        fetchRequest.predicate = NSPredicate(format: "parentProject == %@", project)
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        try resultsController.performFetch()
        
        return resultsController
    }
    
    //Tickets Fetch
    func fetchedResultsControllerForTicketsInColumn(column: Column) throws -> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(namedEntity: Column.self)
        fetchRequest.predicate = NSPredicate(format: "parentColumn == %@", column)
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        try resultsController.performFetch()
        
        return resultsController
    }
 
    //Add Project to Directory
    func addProject(name: String, mainColor: NSObject, secondaryColor: NSObject, possibleColumnsArray: [Any], notificationsStatus: Bool, orderIndex: Int) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let project = NSEntityDescription.insertNewObjectForNamedEntity(Project.self, inManagedObjectContext: context)
        
        //Attributes
        project.projectName = name
        project.projectColorMain = mainColor
        project.projectColorSecondary = secondaryColor
        project.projectNotifications = notificationsStatus
        project.projectCreationDate = NSDate()
        project.projectTicketCount = 0
        
        /* Handling Variable Amount of Columns */
        // NOTE: Size of possibleColumnsArray is 6. Contains at least 3 items of type String and at most 3 items of type nil
        var actualColumnArray: [String] = []
        //sift througgh possibleColumnsArray to find every item of type String (those are the actual columns)
        for column in possibleColumnsArray {
            if let nonEmptyColumn = column as? String {
                actualColumnArray.append(nonEmptyColumn)
            } else {
                // column is empty
            }
        }
        project.projectColumnCount = actualColumnArray.count
        let columnOrderedSet = NSOrderedSet(array: actualColumnArray)
        
        var i: Int = 0
        for column in columnOrderedSet {
            //Relationships
            try addColumn(column as! String, index: i, parent: project)
            i = i + 1
        }
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'addProject' save finished")
        }
    }
    
    //Add Column to Project
    func addColumn(name: String, index: Int, parent: Project) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let column = NSEntityDescription.insertNewObjectForNamedEntity(Column.self, inManagedObjectContext: context)
        
        //Attributes
        column.columnName = name
        column.columnIndex = index
        column.columnTicketCount = 0  //Ticket Count is 0 for new column
        
        //Relationships
        column.parentProject = parent
        
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'addColumn' save finished")
        }
    }
    
    //Add Ticket to Column
    func addTicket(name: String, assignee: String?, comments: String?, detail: String?, label: String?, milestone: NSDate?, project: Project, column: Column) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let ticket = NSEntityDescription.insertNewObjectForNamedEntity(Ticket.self, inManagedObjectContext: context)
        
        ticket.ticketTitle = name
        ticket.ticketAssignee = assignee
        ticket.ticketComments = comments
        ticket.ticketDetail = detail
        ticket.ticketLabel = label
        ticket.ticketMilestone = milestone
        ticket.ticketCreationDate = NSDate()
        let lastNum = project.projectTicketCount as! Int //will this work to get the ticket number?
        ticket.ticketNumber = lastNum + 1
        
        //how do I set relationship to parentColumn?
        ticket.parentColumn = column
        
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'addTicket' save finished")
        }
    }
    
    func moveTicket(ticket: Ticket, column: Column) {
        //let context = CoreDataService.sharedCoreDataService.mainQueueContext
        ticket.setValue(column, forKey: "parentColumn")
        
        //try context.save() //errors here?
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'moveTicket' save finished")
        }
    }
 
    //Edit Project Attributes
    func editProject(project: Project, newName: String, newMainColor: NSObject, newSecondaryColor: NSObject, newColumnNum: NSNumber, newNotificationStatus: Bool) throws {
        project.projectName = newName
        project.projectColorMain = newMainColor
        project.projectColorSecondary = newSecondaryColor
        project.projectColumnCount = newColumnNum
        project.projectNotifications = newNotificationStatus
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'editProject' save finished")
        }
    }
    
    //Edit Ticket Attributes
    func editTicket(ticket: Ticket, newName: String, newAssignee: String?, newComment: String?, newDetail: String?, newLabel: String?, newMilestone: NSDate?) throws {
        ticket.ticketTitle = newName
        ticket.ticketAssignee = newAssignee
        ticket.ticketComments = newComment
        ticket.ticketDetail = newDetail
        ticket.ticketLabel = newLabel
        ticket.ticketMilestone = newMilestone
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'editTicket' save finished")
        }
    }
    
    //Create method to move Tickets to new Column if Column is deleted (and create alert for the move)
    
    // MARK: Initialization
    private init() {
    }
    
    // MARK: Singleton
    static var sharedTraskService = TraskService()
    
    
    /*
     // Functionality to delete projects
     func deleteProject(project: Project, withSaveCompletionHandler saveCompletionHandler: SaveCompletionHandler) throws {
     let context = CoreDataService.sharedCoreDataService.mainQueueContext
     
     context.deleteObject(project)
     
     try context.save()
     
     CoreDataService.sharedCoreDataService.saveRootContext {
     print("'deleteProject' save finished")
     
     saveCompletionHandler()
     }
     }
     */
    
    /*
     // Functionality to reorder projects
     func reindexProjects(projects: Array<Project>, shiftForward: Bool, withSaveCompletionHandler saveCompletionHandler: SaveCompletionHandler? = nil) throws {
     
     for project in projects {
     let currentOrderIndex = project.projectNumber.integerValue
     if shiftForward {
     project.projectNumber = currentOrderIndex + 1
     }
     else {
     project.projectNumber = currentOrderIndex - 1
     }
     }
     
     let context = CoreDataService.sharedCoreDataService.mainQueueContext
     try context.save()
     
     CoreDataService.sharedCoreDataService.saveRootContext {
     print("'reindexProjects' save finished")
     
     saveCompletionHandler?()
     }
     }
     */
}