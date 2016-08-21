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
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Sections.AllSections.count
    }
    
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
    
    //temporary
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath {
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
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            return cell
        case 4:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationAddColumnCell") as UITableViewCell!
            return cell
        case 5:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationNotificationsCell") as UITableViewCell!
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationTitleCell") as UITableViewCell!
            return cell
        }
    }
    */

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch Sections.AllSections[indexPath.section] {
        case .DetailRows:
            switch DetailRows.AllRows[indexPath.row] {
            case .ProjectTitle:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationTitleCell") as UITableViewCell!
                return cell
            case .MainColorSelector:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationMainColorCell") as UITableViewCell!
                return cell
            case .SecondaryColorSelector:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationSecondaryColorCell") as UITableViewCell!
                return cell
            }
        case .ColumnRows:
            switch ColumnRows.AllRows[indexPath.row] {
            case .Column1:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                return cell
            case .Column2:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                return cell
            case .Column3:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                return cell
            case .Column4:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                return cell
            case .Column5:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                return cell
            case .Column6:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                return cell
            case .AddColumn:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationAddColumnCell") as UITableViewCell!
                return cell
            }
        case .NotificationRow:
            switch NotificationRow.AllRows[indexPath.row] {
            case .SwitchOn:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationNotificationsCell") as UITableViewCell!
                return cell
            case .SwitchOff:
                let cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationNotificationsCell") as UITableViewCell!
                return cell
            }
        }
    }
    
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
        
        static let AllRows: Array<DetailRows> = [.ProjectTitle, .MainColorSelector, .SecondaryColorSelector]
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

    weak var delegate : CreateProjectTableVCDelegate?
    //var ColumnRows: Int = TraskService.fetchedResultsControllerForColumnsInProject(project).count
    
    // MARK: Properties (Private)
    private var fetchedResultsController: NSFetchedResultsController?
    private var horizontalSwipeToEditMode = false
    private var ignoreUpdates = false
    
    // MARK : Properties (IBOutlet)
    @IBOutlet weak private var projectCreationTableView: UITableView!
    
    // MARK: Properties (Private Static Constant)
    private static let DefaultName = "Unnamed Project"
    private static let DefaultColumnName = "Unnamed Column"
}
