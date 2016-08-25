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
    // MARK: IBActions
    @IBAction private func saveProjectButton(sender: AnyObject) {
        addProject()
        delegate?.projectCreationVCDidFinish(self)
    }
    
    
    // MARK: CoreData Connection
    func addProject() {
        let name = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as! TitleTableViewCell).titleTextField.text
        print("Name returns as: \(name)")
        let color = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as! ColorSelectorTableViewCell).colorTextField.text
        print("Color returns as: \(color)")
        let notificationBool = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 2, inSection: 0)) as! NotificationsTableViewCell).notificationSwitch.on
        print("Switch returns as: \(notificationBool)")
        var columns = Array<String>()
        for row in 0...tableView(tableView, numberOfRowsInSection: 1) {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 1))
            print( "String(cell.dynamicType) -> \(cell.dynamicType)")
            columns.append((tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 1)) as! ColumnTableViewCell).columnTextField.text!)
        }
        //        TraskService.addProject(name: , mainColor: NSObject, textColor: NSObject, possibleColumnsArray: [String], notificationsStatus: Bool, orderIndex: Int)
        //        TraskService.addProject(<#T##TraskService#>)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    // MARK: Table View DataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Sections.AllSections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections.AllSections[section] {
        case .DetailSection:
            return DetailSection.AllRows.count
        case .ColumnSection:
            return columnCount < 7 ? columnCount + 1 : columnCount
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        switch Sections.AllSections[indexPath.section] {
        case .DetailSection:
            switch DetailSection.AllRows[indexPath.row] {
            case .ProjectTitleRow:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationTitleCell") as UITableViewCell!
                cell.selectionStyle = UITableViewCellSelectionStyle.None
            case .ColorSelectorRow:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationMainColorCell") as UITableViewCell!
            case .NotificationSwitchRow:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationNotificationsCell") as UITableViewCell!
                cell.selectionStyle = UITableViewCellSelectionStyle.None
            }
        case .ColumnSection:
            switch ColumnSection.AllRows[indexPath.row] {
            case .AddColumnRow:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationAddColumnCell") as UITableViewCell!
                if columnCount > 6 {
                    cell.selectionStyle = UITableViewCellSelectionStyle.None
                    cell.userInteractionEnabled = false
                }
            case .Column1Row:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            case .Column2Row:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            case .Column3Row:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            case .Column4Row:
                if indexPath.row <= columnCount {
                    cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                } else {
                    //
                }
            case .Column5Row:
                if indexPath.row <= columnCount {
                    cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                } else {
                    //
                }
            case .Column6Row:
                if indexPath.row <= columnCount {
                    cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                } else {
                    //
                }
            }
            cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationAddColumnCell") as UITableViewCell!
            //if indexPath.row < columnCount {
            //print("section is \(indexPath.section)")
            //print("row is \(indexPath.row)")
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch Sections.AllSections[indexPath.section] {
        case .DetailSection:
            switch DetailSection.AllRows[indexPath.row] {
            case .ProjectTitleRow:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! TitleTableViewCell
                cell.becomeFirstResponder()
            case .ColorSelectorRow:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColorSelectorTableViewCell
                cell.colorTextField.becomeFirstResponder()
            case .NotificationSwitchRow:
                return
            }
        case .ColumnSection:
            switch ColumnSection.AllRows[indexPath.row] {
            case .AddColumnRow:
                if columnCount < 7 {
                    columnCount += 1
                    tableView.reloadData()
                }
            case .Column1Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
            case .Column2Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
            case .Column3Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
            case .Column4Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
            case .Column5Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
            case .Column6Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
            }
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    // MARK: View Management
    weak var delegate: CreateProjectTableVCDelegate?
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide save button until required fields populated
        //self.navItem.rightBarButtonItem?.enabled = false
    }
    
    
    // MARK: Section/Row Enums
    enum Sections {
        case DetailSection
        case ColumnSection
        
        static let AllSections: Array<Sections> = [.DetailSection, .ColumnSection]
    }
    
    enum DetailSection {
        case ProjectTitleRow
        case ColorSelectorRow
        case NotificationSwitchRow
        
        static let AllRows: Array<DetailSection> = [.ProjectTitleRow, .ColorSelectorRow, .NotificationSwitchRow]
    }
    
    enum ColumnSection {
        case AddColumnRow
        case Column1Row
        case Column2Row
        case Column3Row
        case Column4Row
        case Column5Row
        case Column6Row
        
        static let AllRows: Array<ColumnSection> = [.AddColumnRow, .Column1Row, .Column2Row, .Column3Row, .Column4Row, .Column5Row, .Column6Row]
    }
    
    
    // MARK: Properties (Private)
    private var fetchedResultsController: NSFetchedResultsController?
    private var horizontalSwipeToEditMode = false
    private var ignoreUpdates = false
    private var columnCount = 3
    
    
    // MARK : Properties (IBOutlet)
    @IBOutlet weak private var projectCreationTableView: UITableView!
    @IBOutlet weak var navItem: UINavigationItem!
    
    
    // MARK: Properties (Private Static Constant)
    private static let DefaultName = "Unnamed Project"
    private static let DefaultColumnName = "Unnamed Column"
}
