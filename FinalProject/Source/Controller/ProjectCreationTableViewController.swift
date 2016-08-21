//
//  ProjectCreationTableViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/19/16.
//
//

import UIKit
import CoreData
import CoreDataService

protocol CreateProjectTableVCDelegate: class {
    func projectCreationVCDidFinish(projectCreationVC: ProjectCreationTableViewController)
}

class ProjectCreationTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    // MARK: View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Project"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View Functions
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections.AllSections[section] {
        case .DetailRows:
            return DetailRows.AllRows.count
        case .ColumnRows:
            return ColumnRows.AllRows.count
        case .NotificationRow:
            return NotificationRow.AllRows.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationTitleCell") as UITableViewCell!
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationMainColorCell") as UITableViewCell!
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationSecondaryColorCell") as UITableViewCell!
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumn1Cell") as UITableViewCell!
            
            return cell
        case 4:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumn2Cell") as UITableViewCell!
            
            return cell
        case 5:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumn3Cell") as UITableViewCell!
            
            return cell
        case 6:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationAddColumnCell") as UITableViewCell!
            
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationNotificationsCell") as UITableViewCell!
            
            return cell
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    weak var delegate : CreateProjectTableVCDelegate?
    
    // MARK: Properties (Private)
    private var fetchedResultsController: NSFetchedResultsController?
    private var horizontalSwipeToEditMode = false
    private var ignoreUpdates = false
    
    // MARK : Properties (IBOutlet)
    @IBOutlet weak private var projectCreationTableView: UITableView!
    
    // MARK: Properties (Private Static Constant)
    private static let DefaultName = "Unnamed Project"
    private static let DefaultColumnName = "Unnamed Column"
    
    // MARK: Section/Row Enums
    enum Sections {
        case DetailRows
        case ColumnRows
        case NotificationRow
        
        static let AllSections: Array<Sections> = [.DetailRows, .ColumnRows, .NotificationRow]
    }
    
    enum DetailRows {
        case ProjectTitle
        case MainColorSelector
        case SecondaryColorSelector
        case Column1
        case Column2
        case Column3
        case AddColumn
        case Notifications
        
        static let AllRows: Array<DetailRows> = [.ProjectTitle, .MainColorSelector, .SecondaryColorSelector, .Notifications]
    }
    
    enum ColumnRows {
        case Column1
        case Column2
        case Column3
        case Column4
        case Column5
        case Column6
        case AddColumn
        
        static let AllRows: Array<ColumnRows> = [.Column1, .Column2, .Column3, .Column4, .Column5, .Column6, .AddColumn]
    }
    
    enum NotificationRow {
        case SwitchOn
        case SwitchOff
        
        static let AllRows: Array<NotificationRow> = [.SwitchOn, .SwitchOff]
    }
    
    var ColumnRows: Int = TraskService.fetchedResultsControllerForColumnsInProject(project).count

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
}
