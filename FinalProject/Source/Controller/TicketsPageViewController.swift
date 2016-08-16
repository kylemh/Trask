//
//  TicketsPageViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/1/16.
//
//  Citations for using other authors' materials
//  __________________________________________________________________
//

import UIKit
import CoreData

protocol TicketsPageVCDelegate: class {
    func ticketsPageVCDidFinish(ticketsVC: TicketsPageViewContainerController)
}

class TicketsPageViewContainerController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var pageViewController: UIPageViewController!
    //var columnPages = ["Column1", "Column2", "Column3"]
    weak var delegateMenu : TicketsPageVCDelegate?
    
    @IBAction private func back(sender: AnyObject) {
        delegateMenu?.ticketsPageVCDidFinish(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PageViewControllerEmbedSegue" {
            pageViewController = segue.destinationViewController as! UIPageViewController
            pageViewController.dataSource = self
            pageViewController.delegate = self
        }
        else {
            super.prepareForSegue(segue, sender: sender)
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        return nil
    }
}
