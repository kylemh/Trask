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

class MenuViewController: UIViewController {
    /* View Controller Overrides */
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Delegate and Segue Functions */
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    func projectDirectoryTableVCDidFinish(projectDirectoryVC: ProjectDirectoryTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //TicketsSegue
    //SettingsSegue
    //Do this override for those ^
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "DirectorySegue") {
            let navController = segue.destinationViewController as! UINavigationController
            let directoryVC = navController.topViewController as! ProjectDirectoryTableViewController
            directoryVC.delegate = self
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
}
