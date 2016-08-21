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
    // MARK: Projects Fetch
    func fetchedResultsControllerForProjectList() throws -> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(namedEntity: Project.self)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "projectCreationDate", ascending: true)]
        //fetchRequest.fetchBatchSize = # means that the fetch faults # requests at a time
        //fetchRequest.fetchLimit = # means that the fetchRequest stops requesting after # fetchesk
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        try resultsController.performFetch()
        
        return resultsController
    }
    
    // MARK: Columns Fetch
    func fetchedResultsControllerForColumnsInProject(project: Project) throws -> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(namedEntity: Project.self)
        fetchRequest.predicate = NSPredicate(format: "parentProject == %@", project)
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        try resultsController.performFetch()
        
        return resultsController
    }
    
    // MARK: Tickets Fetch
    func fetchedResultsControllerForTicketsInColumn(column: Column) throws -> NSFetchedResultsController {
        let fetchRequest = NSFetchRequest(namedEntity: Column.self)
        fetchRequest.predicate = NSPredicate(format: "parentColumn == %@", column)
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        try resultsController.performFetch()
        
        return resultsController
    }
 
    // MARK: Add Project to Directory
    func addProject(name: String, mainColor: NSObject, secondaryColor: NSObject, possibleColumnsArray: [String], notificationsStatus: Bool, orderIndex: Int) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let project = NSEntityDescription.insertNewObjectForNamedEntity(Project.self, inManagedObjectContext: context)
        
        //Attributes
        project.projectName = name
        project.projectColorMain = mainColor
        project.projectColorSecondary = secondaryColor
        project.projectNotifications = notificationsStatus
        project.projectCreationDate = NSDate()
        project.projectTicketCount = 0 //Ticket Count is 0 for new Project
        
        /* Handling Variable Amount of Columns */
        let columnSet = NSSet(array: possibleColumnsArray)
        
        var i: Int = 0
        for column in columnSet {
            try addColumn(column as! String, index: i, parent: project)
            i = i + 1
        }
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'addProject' save finished")
        }
    }
    
    // MARK: Add Column to Project
    func addColumn(name: String, index: Int, parent: Project) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let column = NSEntityDescription.insertNewObjectForNamedEntity(Column.self, inManagedObjectContext: context)
        
        //Attributes
        column.columnName = name
        column.columnIndex = index
        column.columnTicketCount = 0  //Ticket Count is 0 for new Column
        
        //Relationship
        column.parentProject = parent
        
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'addColumn' save finished")
        }
    }
    
    // MARK: Add Ticket to Column
    func addTicket(name: String, assignee: String?, comments: String?, detail: String?, label: String?, milestone: NSDate, column: Column) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let ticket = NSEntityDescription.insertNewObjectForNamedEntity(Ticket.self, inManagedObjectContext: context)
        
        //Attributes
        ticket.ticketTitle = name
        ticket.ticketAssignee = assignee
        ticket.ticketComments = comments
        ticket.ticketDetail = detail
        ticket.ticketLabel = label
        ticket.ticketMilestone = milestone
        ticket.ticketCreationDate = NSDate()
        let newTicketCount = (column.parentProject.projectTicketCount as Int) + 1
        column.parentProject.projectTicketCount = newTicketCount
        ticket.ticketNumber = newTicketCount
        
        //Relationship
        ticket.parentColumn = column
        
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'addTicket' save finished")
        }
    }
    
    func moveTicket(ticket: Ticket, column: Column) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        
        ticket.parentColumn = column
        
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'moveTicket' save finished")
        }
    }
 
    // MARK: Edit Project Attributes
    func editProject(project: Project, newName: String, newMainColor: NSObject, newSecondaryColor: NSObject, newColumnNum: NSNumber, newNotificationStatus: Bool) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        
        //Attribute Changes
        project.projectName = newName
        project.projectColorMain = newMainColor
        project.projectColorSecondary = newSecondaryColor
        project.projectNotifications = newNotificationStatus
        
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'editProject' save finished")
        }
    }
    
    // MARK: Edit Ticket Attributes
    func editTicket(ticket: Ticket, newName: String, newAssignee: String?, newComment: String?, newDetail: String?, newLabel: String?, newMilestone: NSDate) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        
        //Attribute Changes
        ticket.ticketTitle = newName
        ticket.ticketAssignee = newAssignee
        ticket.ticketComments = newComment
        ticket.ticketDetail = newDetail
        ticket.ticketLabel = newLabel
        ticket.ticketMilestone = newMilestone
        
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'editTicket' save finished")
        }
    }
    
    // MARK: Delete Column
    func deleteColumn(markedColumn: Column, withNewParentColumn newParentColumn: Column, withSaveCompletionHandler saveCompletionHandler: SaveCompletionHandler) throws {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        
        let fetchRequest = NSFetchRequest(namedEntity: Column.self)
        fetchRequest.predicate = NSPredicate(format: "parentColumn == %@", markedColumn)
        let associatedTickets = (try? context.executeFetchRequest(fetchRequest)) as! [Ticket]
        
        //let associatedTickets: [Ticket] = try fetchedResultsControllerForTicketsInColumn(markedColumn).fetchedObjects as! [Ticket]
        
        for ticket in associatedTickets {
            try moveTicket(ticket, column: newParentColumn)
        }
        
        context.deleteObject(markedColumn)
        
        try context.save()
        
        
        // TODO: deal with the saveCompletionHandler
        // TODO: Ensure thet saveCompletionHandler should be type optional/nonoptional based upon call
        // in order to keep screen from closing before context save
        // saveCompletionHandler for delete column will allow for reindexColumns func call
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'deleteColumn' save finished")
            saveCompletionHandler()
        }
    }
    
    // MARK: Reindex Column
    func reindexColumns(columns: Array<Column>, shiftForward: Bool, withSaveCompletionHandler saveCompletionHandler: SaveCompletionHandler? = nil) throws {
        for column in columns {
            let currentOrderIndex = column.columnIndex.integerValue
            if shiftForward {
                column.columnIndex = currentOrderIndex + 1
            } else {
                column.columnIndex = currentOrderIndex - 1
            }
        }
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        try context.save()
        
        CoreDataService.sharedCoreDataService.saveRootContext {
            print("'reindexColumns' save finished")
            saveCompletionHandler?()
            
        }
    }
    
    // MARK: Initialization
    private init() {
    }
    
    // MARK: Singleton
    static var sharedTraskService = TraskService()
}