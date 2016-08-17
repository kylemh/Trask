//
//  NotificationsViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/1/16.
//
//  Citations for using other authors' materials
//  __________________________________________________________________
//  Citation1: https://github.com/awseeley/Swift-Pop-Up-View-Tutorial/
//

import UIKit
import CoreData

class NotificationsViewController: UIViewController {
    /* Outlets and Actions */
    @IBAction func closeNotificationsButton(sender: AnyObject) {
        self.removeAnimate()
    }
    //optional: instead of close button, make it so user can rid pop-up screen by touching outside of it.
    
    
    /* Pop-Up Animation - Provided by Citation1 */
    func showAnimate() {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        });
    }
    
    func removeAnimate() {
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished) {
                    self.view.removeFromSuperview()
                    self.removeFromParentViewController()
                }
        });
    }
    
    
    /* View Controller Functions */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        self.showAnimate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
