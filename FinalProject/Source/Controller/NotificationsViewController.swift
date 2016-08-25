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
    // MARK: IBAction
    @IBAction func closeNotificationsButton(sender: AnyObject) {
        self.removeAnimate()
    }
    
    
    // MARK: Pop-Up Functions
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
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        self.showAnimate()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.removeAnimate))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
}
