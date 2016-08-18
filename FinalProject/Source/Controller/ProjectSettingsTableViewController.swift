//
//  ProjectSettingsTableViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/4/16.
//
//  Citations for using other authors' materials
//  __________________________________________________________________
//

import UIKit
import CoreData

protocol ProjectSettingsTableVCDelegate: class {
    func projectSettingsTableVCDidFinish(settingsVC: ProjectSettingsTableViewController)
}

class ProjectSettingsTableViewController: UITableViewController {
    /* Outlets and Actions */
    @IBAction private func back(sender: AnyObject) {
        delegate?.projectSettingsTableVCDidFinish(self)
    }
    
    @IBAction private func edit(sender: AnyObject) {
        //
    }
    
    weak var delegate : ProjectSettingsTableVCDelegate?
    
    /* View Controller Functions */
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