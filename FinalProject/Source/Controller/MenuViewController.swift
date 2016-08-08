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

class MenuViewController: UIViewController, DirectoryTableVCDelegate, TicketsPageVCDelegate, SettingsTableVCDelegate {
    /* Delegate Functions */
    func projectDirectoryTableVCDidFinish(directoryVC: ProjectDirectoryTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func ticketsPageVCDidFinish(ticketsVC: TicketsPageViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func settingsTableVCDidFinish(settingsVC: SettingsTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "DirectorySegue") {
            let navController = segue.destinationViewController as! UINavigationController
            let directoryVC = navController.topViewController as! ProjectDirectoryTableViewController
            directoryVC.delegate = self
        } else if (segue.identifier == "TicketsSegue") {
            let navController = segue.destinationViewController as! UINavigationController
            let ticketsVC = navController.topViewController as! TicketsPageViewController
            ticketsVC.delegateMenu = self
        } else if (segue.identifier == "SettingsSegue") {
            let navController = segue.destinationViewController as! UINavigationController
            let settingsVC = navController.topViewController as! SettingsTableViewController
            settingsVC.delegate = self
        } else {
            //is error necessary?
        }
    }
    
    /* Buttons */
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
    
    /* View Controller Functions */
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
