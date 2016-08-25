//
//  ProjectDirectoryTableViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/1/16.
//
//

import UIKit
import CoreData
import CoreDataService

protocol DirectoryTableVCDelegate: class {
    func projectDirectoryTableVCDidFinish(directoryVC: ProjectDirectoryTableViewController)
}

class ProjectDirectoryTableViewController: UITableViewController, CreateProjectTableVCDelegate, NSFetchedResultsControllerDelegate {
    // Mark: IBActions
    @IBAction private func back(sender: AnyObject) {
        delegate?.projectDirectoryTableVCDidFinish(self)
    }
    
    @IBAction private func add(sender: AnyObject) {
        //
    }
    
    
    // MARK: CoreData Connection
    private func setupResultsController() {
        if let resultsController = try? TraskService.sharedTraskService.fetchedResultsControllerForProjectList() {
            resultsController.delegate = self
            fetchedResultsController = resultsController
        }
        else {
            fetchedResultsController = nil
        }
        
        projectDirectoryTableView.reloadData()
    }
    
    
    // MARK: Table Population
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let result: Int
        
        if let someSections = fetchedResultsController?.sections {
            result = someSections.count
        }
        else {
            result = 0
        }
        
        return result
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        //
    }

    
    // MARK: View Management
    weak var delegate: DirectoryTableVCDelegate?
    
    func projectCreationVCDidFinish(projectCreationVC: ProjectCreationTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Cancel"
        navigationItem.backBarButtonItem = backItem
        
        if (segue.identifier == "createProjectSegue") {
            let projectCreationVC = segue.destinationViewController as! ProjectCreationTableViewController
            projectCreationVC.delegate = self
            projectCreationVC.title = "Add Project"
            // TODO: Create segue behavior for selecting a project cell in the project directory TableVC
            /*
             } else if (A PROJECT CELL IS SELECTED) {
             maintain a variable containing current project to persist data to settings, notifications, and tickets
             set destinationVC to Menu
             */
        } else {
            super.prepareForSegue(segue, sender: sender)
        }
    }
    
    
    // MARK: View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Project Directory"
                
        //setupResultsController()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = projectDirectoryTableView.indexPathForSelectedRow {
            projectDirectoryTableView.deselectRowAtIndexPath(selectedIndexPath, animated: false)
        }
    }

    
    // MARK: Properties (Private)
    private var ignoreUpdates = false
    private var fetchedResultsController: NSFetchedResultsController?
    
    
    // MARK: IBOutlets
    @IBOutlet weak private var projectDirectoryTableView: UITableView!
    
}
