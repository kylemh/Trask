//
//  ProjectDirectoryTableViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/1/16.
//
//  Citations for using other authors' materials
//  __________________________________________________________________
//

import UIKit
import CoreData

protocol DirectoryTableVCDelegate: class {
    func projectDirectoryTableVCDidFinish(directoryVC: ProjectDirectoryTableViewController)
}

class ProjectDirectoryTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    /* Outlets and Actions */
    @IBOutlet var projectDirectoryTableView: UITableView!
    weak var delegate : DirectoryTableVCDelegate?
    
    @IBAction private func back(sender: AnyObject) {
        delegate?.projectDirectoryTableVCDidFinish(self)
    }
    
    @IBAction private func add(sender: AnyObject) {
        //
    }

    
    /* Table Population */
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
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

    /* View Controller Functions */
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Project Directory"
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Cancel"
        navigationItem.backBarButtonItem = backItem
    }
}
