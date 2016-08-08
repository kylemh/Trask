//
//  SettingsTableViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/4/16.
//
//

import UIKit
import CoreData

protocol SettingsTableVCDelegate: class {
    func settingsTableVCDidFinish(settingsVC: SettingsTableViewController)
}

//add UITableViewDataSource after table methods added
class SettingsTableViewController: UITableViewController {
    @IBAction private func back(sender: AnyObject) {
        delegate?.settingsTableVCDidFinish(self)
    }
    
    weak var delegate : SettingsTableVCDelegate?
    
    /*
    //Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Section.AllSections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section.AllSections[section] {
        case .MainColorSelector:
            return MainColorSelectorRow.AllRows.count
        case .SecondaryColorSelector:
            return SecondaryColorSelectorRow.AllRows.count
        case .NotificationsToggle:
            return NotificationsToggleRow.AllRows.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch Section.AllSections[indexPath.section] {
        case .MainColorSelector:
            switch .MainColorSelectorRow.AllRows[indexPath.row] {
            case .Red:
                break
            case .Orange:
                break
            case .Yellow:
                break
            case .Green:
                break
            case .Blue:
                break
            case .Indigo:
                break
            case .Violet:
                break
            }
        case .SecondaryColorSelector:
            switch .SecondaryColorSelectorRow.AllRows[indexPath.row] {
            case .Red:
                break
            case .Orange:
                break
            case .Yellow:
                break
            case .Green:
                break
            case .Blue:
                break
            case .Indigo:
                break
            case .Violet:
                break
            }
        case .NotificationsToggle:
            switch .NotificationsToggleRow.AllRows[indexPath.row] {
            case .SwitchOn:
                break
            case .SwitchOff:
                break
            }
        }
    }
    
    //private?
    enum Section {
        case MainColorSelector
        case SecondaryColorSelector
        case NotificationsToggle
        
        static let AllSections: Array<Section> = [.MainColorSelector, .SecondaryColorSelector, .NotificationsToggle]
    }
    
    //private?
    enum MainColorSelectorRow {
        case Red
        case Orange
        case Yellow
        case Green
        case Blue
        case Indigo
        case Violet
        
        static let AllRows: Array<MainColorSelectorRow> = [.Red, .Orange, .Yellow, .Green, .Blue, .Indigo, .Violet]
    }

    //private?
    enum SecondaryColorSelectorRow {
        case Red
        case Orange
        case Yellow
        case Green
        case Blue
        case Indigo
        case Violet
        case White
        case Black

        static let AllRows: Array<SecondaryColorSelectorRow> = [.Red, .Orange, .Yellow, .Green, .Blue, .Indigo, .Violet, .White, .Black]
    }
    
    //private?
    enum NotificationsToggleRow {
        case SwitchOn
        case SwitchOff
        
        static let AllRows: Array<NotificationsToggleRow> = [.SwitchOn, .SwitchOff]
    }
    */
 
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
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

    }
     
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
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
}