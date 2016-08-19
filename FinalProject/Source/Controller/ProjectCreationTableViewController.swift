//
//  ProjectCreationTableViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/17/16.
//
//

import UIKit

class ProjectCreationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Section.AllSections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section.AllSections[section] {
        case .Details:
            return DetailRows.AllRows.count
        case .Columns:
            return ColumnRows.AllRows.count
        case .Notifications:
            return NotificationsRow.AllRows.count
        }
    }
    
    enum Section {
        case Details
        case Columns
        case Notifications
        
        static let AllSections: Array<Section> = [.Details, .Columns, .Notifications]
    }
    
    enum DetailRows {
        case ProjectName
        case MainColorSelector
        case SecondaryColorSelector
        
        static let AllRows: Array<DetailRows> = [.ProjectName, .MainColorSelector, .SecondaryColorSelector]
    }
    
    var ColumnRows: Int = 3 //minimum
    
    enum NotificationsRow {
        case SwitchOn
        case SwitchOff
        
        static let AllRows: Array<NotificationsRow> = [.SwitchOn, .SwitchOff]
    }
    
    /*
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
     return cell
     }
     */
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch Section.AllSections[indexPath.section] {
        case .Details:
            switch DetailRows.AllRows[indexPath.row] {
            case .ProjectName:
                break
            case .MainColorSelector:
                break
            case .SecondaryColorSelector:
                break
            }
        case .Columns:
            switch ColumnRows.AllRows[indexPath.row] {
            case .Column1:
                break
            case .Column2:
                break
            case .Column3:
                break
            case .Column4:
                break
            case .Column5:
                break
            case .Column6:
                break
            }
        case .Notifications:
            switch NotificationsRow.AllRows[indexPath.row] {
            case .SwitchOn:
                break
            case .SwitchOff:
                break
            }
        }
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

}
