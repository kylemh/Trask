//
//  MenuViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/1/16.
//
//  Citations for using other authors' materials
//  __________________________________________________________________
//

import UIKit
import CoreData
import CoreDataService

class MenuViewController: UIViewController, DirectoryTableVCDelegate, TicketsPageVCDelegate, ProjectSettingsTableVCDelegate {
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
    
    // MARK: Delegate Functions
    func projectDirectoryTableVCDidFinish(directoryVC: ProjectDirectoryTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func ticketsPageVCDidFinish(ticketsVC: TicketsPageViewContainerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func projectSettingsTableVCDidFinish(settingsVC: ProjectSettingsTableViewController) {
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
            let navController = segue.destinationViewController as! UINavigationController
            let settingsVC = navController.topViewController as! ProjectSettingsTableViewController
            settingsVC.delegate = self
        } else {
            super.prepareForSegue(segue, sender: sender)
        }
    }
    
    /*
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     if segue.identifier == "LentItemListSegue" {
     if let indexPath = categoryListTable.indexPathForSelectedRow, let selectedCategory = fetchedResultsController?.objectAtIndexPath(indexPath) as? Category {
     let lentItemListViewController = segue.destinationViewController as! LentItemListViewController
     lentItemListViewController.selectedCategory = selectedCategory
     
     categoryListTable.deselectRowAtIndexPath(indexPath, animated: true)
     }
     }
     else if segue.identifier == "AddCategorySegue" {
     let navigationController = segue.destinationViewController as! UINavigationController
     let categoryDetailViewController = navigationController.topViewController as! CategoryDetailViewController
     categoryDetailViewController.delegate = self
     }
     else if segue.identifier == "CategoryDetailSegue" {
     if let indexPath = categoryListTable.indexPathForSelectedRow, let selectedCategory = fetchedResultsController?.objectAtIndexPath(indexPath) as? Category {
     let categoryDetailViewController = segue.destinationViewController as! CategoryDetailViewController
     categoryDetailViewController.selectedCategory = selectedCategory
     categoryDetailViewController.delegate = self
     }
     }
     else {
     super.prepareForSegue(segue, sender: sender)
     }
     }
     */
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //Place to do screen refresh, network request, or last-minute view setup
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //App is loaded and ready. Commence heavy activity
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        //App has been removed from screen. Clean-up memory usage.
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //Memory clean-up complete.
    }
}
