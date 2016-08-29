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
    }
    
    // MARK: CoreData Connection
    func addProject() {
        
        let name = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as! TitleTableViewCell).titleTextField.text
        let mainColor = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as! ColorSelectorTableViewCell).colorTextField.text
        let textColor = getTextColorForTheme(mainColor!)
        let notificationsBool = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 2, inSection: 0)) as! NotificationsTableViewCell).notificationSwitch.on
        
        //Get Project's Column Names
        var columnArray = Array<String>()
        for row in 2...columnCount+1 {
            let columnName = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 1)) as! ColumnTableViewCell).columnTextField.text!
            columnArray.append(columnName)
        }
        
        //Add to CoreData
        do {
            print("Getting to the do clause properly, but context isnt working in the TraskService file")
            try TraskService.sharedTraskService.addProject(name!, mainColor: mainColor!, textColor: textColor, notificationsStatus: notificationsBool, columnsArray: columnArray, orderIndex: 0)
            delegate?.projectCreationVCDidFinish(self)
        } catch {
            let alertController = UIAlertController(title: "Empty Text Fields", message: "Please be certain you've named the project and given a name to every column.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    /*
    //Convert color name sting to UIColor for Data Service
    //put:: let projectColor = colorConversion(colorName!) in addProject() if UIColor in Data Model instead of String
    func colorConversion(colorName: String) -> UIColor {
        switch colorName {
            case "Black":
                return UIColor.blackColor()
            case "White":
                return UIColor.whiteColor()
            case "Red":
                return UIColor.redColor()
            case "Blue":
                return UIColor.blueColor()
            case "Green":
                return UIColor.greenColor()
            case "Yellow":
                return UIColor.yellowColor()
            case "Purple":
                return UIColor.purpleColor()
            default:
                return UIColor.blackColor()
        }
    }
    */
    
    func getTextColorForTheme(colorName: String) -> String {
        switch colorName {
        case "Black":
            return "White"
        case "White":
            return "Black"
        case "Red":
            return "Red"
        case "Blue":
            return "White"
        case "Green":
            return "Black"
        case "Yellow":
            return "Black"
        case "Purple":
            return "White"
        default:
            return "White"
        }
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
            return columnCount <= 6 ? columnCount + 2 : columnCount
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
                if columnCount >= 6 {
                    cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationAddColumnCell") as UITableViewCell!
                    cell.selectionStyle = UITableViewCellSelectionStyle.None
                    cell.userInteractionEnabled = false
                    cell.backgroundColor = UIColor.lightGrayColor()
                } else {
                    cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationAddColumnCell") as UITableViewCell!
                    cell.selectionStyle = UITableViewCellSelectionStyle.Default
                    cell.userInteractionEnabled = true
                    cell.backgroundColor = UIColor.greenColor()
                }
            case .RemoveColumnRow:
                if columnCount >= 4 {
                    cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationRemoveColumnCell") as UITableViewCell!
                    cell.selectionStyle = UITableViewCellSelectionStyle.Default
                    cell.userInteractionEnabled = true
                    cell.backgroundColor = UIColor.redColor()
                } else {
                    cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationRemoveColumnCell") as UITableViewCell!
                    cell.selectionStyle = UITableViewCellSelectionStyle.None
                    cell.userInteractionEnabled = false
                    cell.backgroundColor = UIColor.lightGrayColor()
                }
            case .Column1Row:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            case .Column2Row:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            case .Column3Row:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            case .Column4Row:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            case .Column5Row:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            case .Column6Row:
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
            }
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
                if columnCount <= 6 {
                    columnCount += 1
                    tableView.reloadData()
                }
            case .RemoveColumnRow:
                if columnCount >= 4 {
                    columnCount -= 1
                    tableView.reloadData()
                }
            case .Column1Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
                cell.columnTextField.editing
            case .Column2Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
                cell.columnTextField.editing
            case .Column3Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
                cell.columnTextField.editing
            case .Column4Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
                cell.columnTextField.editing
            case .Column5Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
                cell.columnTextField.editing
            case .Column6Row:
                let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColumnTableViewCell
                cell.columnTextField.becomeFirstResponder()
                cell.columnTextField.editing
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
        case RemoveColumnRow
        case Column1Row
        case Column2Row
        case Column3Row
        case Column4Row
        case Column5Row
        case Column6Row
        
        static let AllRows: Array<ColumnSection> = [.AddColumnRow, .RemoveColumnRow, .Column1Row, .Column2Row, .Column3Row, .Column4Row, .Column5Row, .Column6Row]
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
