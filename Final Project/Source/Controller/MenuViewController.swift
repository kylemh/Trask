//
//  MenuViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/1/16.
//
//

import UIKit
import CoreData
import CoreDataService

class MenuViewController: UIViewController, DirectoryTableVCDelegate, TicketsPageVCDelegate, CreateProjectTableVCDelegate {
    // MARK: IBAction
    @IBAction func menuToDirectoryButton(sender: AnyObject) {
        //
    }
    
    @IBAction func menuToTicketsButton(sender: AnyObject) {
        //
    }
    
    @IBAction func menuToNotificationsButton(sender: AnyObject) {
        let notificationsPopUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("NotificationsID") as! NotificationsViewController
        self.addChildViewController(notificationsPopUpVC)
        notificationsPopUpVC.view.frame = self.view.frame
        self.view.addSubview(notificationsPopUpVC.view)
        notificationsPopUpVC.didMoveToParentViewController(self)
    }
    
    @IBAction func menuToChatButton(sender: AnyObject) {
        //
    }
    
    @IBAction func menuToSettingsButton(sender: AnyObject) {
        //
    }
    
    // MARK: View Management
    func projectDirectoryTableVCDidFinish(directoryVC: ProjectDirectoryTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func ticketsPageVCDidFinish(ticketsVC: TicketsPageViewContainerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func projectCreationVCDidFinish(projectCreationVC: ProjectCreationTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "DirectorySegue") {
            let navController = segue.destinationViewController as! UINavigationController
            let directoryVC = navController.topViewController as! ProjectDirectoryTableViewController
            directoryVC.delegate = self
        } else if (segue.identifier == "TicketsSegue") {
            let backItem = UIBarButtonItem()
            backItem.title = "Menu"
            navigationItem.backBarButtonItem = backItem
        } else if (segue.identifier == "SettingsSegue") {
            let projectCreationVC = segue.destinationViewController as! ProjectCreationTableViewController
            projectCreationVC.delegate = self
            projectCreationVC.navItem.title = "Edit Project"
            //segue.destinationViewController.title = "Edit Project"
            let backItem = UIBarButtonItem()
            backItem.title = "Menu"
            navigationItem.backBarButtonItem = backItem
        } else {
            super.prepareForSegue(segue, sender: sender)
        }
    }
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Menu"
        
        // NavBar Color and Title based upon selected project
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update NavBar Color and Title based upon selected project
    }
}
