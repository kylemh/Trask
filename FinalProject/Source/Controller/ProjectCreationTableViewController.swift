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
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    func addProject() {
        
        let name = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as! TitleTableViewCell).titleTextField.text
        let color = (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as! ColorSelectorTableViewCell).colorTextField.text
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
    
    // MARK: View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Project"
        
        let button = UIButton(type: .Custom)
        button.setTitle("Add", forState: .Normal)
        button.addTarget(self, action: #selector(ProjectCreationTableViewController.addProject), forControlEvents: .TouchUpInside)
        button.bounds = CGRectMake(0,0,70,34)
        button.tintColor = UIColor.redColor()
        button.titleLabel?.textColor = UIColor.redColor()
        button.enabled = true
        let item = UIBarButtonItem(customView: button)
        item.tintColor = UIColor.redColor()
        item.enabled = true
        self.navItem.rightBarButtonItem = item
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
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
        case .DetailSection:
            return DetailSection.AllRows.count
        case .ColumnSection:
            return columnCount < 6 ? columnCount + 1 : columnCount
        case .NotificationSection:
            return 1
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
            }
        case .ColumnSection:
            if indexPath.row < columnCount {
                print("section is \(indexPath.section)")
                print("row is \(indexPath.row)")

                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationColumnCell") as UITableViewCell!
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                if cell is ColumnTableViewCell {
                    print("cast is fine")
                }
            } else {
                cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationAddColumnCell") as UITableViewCell!
            }
        case .NotificationSection:
            cell = tableView.dequeueReusableCellWithIdentifier("ProjectCreationNotificationsCell") as UITableViewCell!
            cell.selectionStyle = UITableViewCellSelectionStyle.None
        }
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (Sections.AllSections[indexPath.section] == .DetailSection) {
            if (DetailSection.AllRows[indexPath.row] == .ProjectTitleRow) {
                
            }
        }
        
        
        if (Sections.AllSections[indexPath.section] == .ColumnSection && indexPath.row == columnCount) {
            if columnCount < 6 {
                columnCount += 1
                tableView.reloadData()
            }
        } else if (Sections.AllSections[indexPath.section] == .DetailSection && DetailSection.AllRows[indexPath.row] == .ColorSelectorRow) {
            let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! ColorSelectorTableViewCell
            cell.colorTextField.becomeFirstResponder()
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: Section/Row Enums
    enum Sections {
        case DetailSection
        case ColumnSection
        case NotificationSection
        
        static let AllSections: Array<Sections> = [.DetailSection, .ColumnSection, .NotificationSection]
    }
    
    enum DetailSection {
        case ProjectTitleRow
        case ColorSelectorRow
        
        static let AllRows: Array<DetailSection> = [.ProjectTitleRow, .ColorSelectorRow]
    }
    
    weak var delegate : CreateProjectTableVCDelegate?
    
    // MARK: Properties (Private)
    private var fetchedResultsController: NSFetchedResultsController?
    private var horizontalSwipeToEditMode = false
    private var ignoreUpdates = false
    private var columnCount = 3
    
    // MARK : Properties (IBOutlet)
    @IBOutlet weak private var projectCreationTableView: UITableView!
    
    // MARK: Properties (Private Static Constant)
    private static let DefaultName = "Unnamed Project"
    private static let DefaultColumnName = "Unnamed Column"
}
