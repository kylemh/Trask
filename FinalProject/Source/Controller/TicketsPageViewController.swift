//
//  TicketsPageViewContainerController.swift
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

protocol TicketsPageVCDelegate: class {
    func ticketsPageVCDidFinish(ticketsVC: TicketsPageViewContainerController)
}

class TicketsPageViewContainerController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // MARK: IBActions
    @IBAction private func back(sender: AnyObject) {
        delegateMenu?.ticketsPageVCDidFinish(self)
    }
    
    @IBAction private func add(sender: AnyObject) {
        //
    }
    
    
    // MARK: Page View Controller Population
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = orderedViewControllers.first,
            firstViewControllerIndex = orderedViewControllers.indexOf(firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        pageControl.currentPage = orderedViewControllers.indexOf(pendingViewControllers.first!)!
    }
    
    
    // MARK: View Management
    weak var delegateMenu: TicketsPageVCDelegate?
    
    private func newColumnVC(columnName: String, columnTicketCount: Int32?, tempColumnNumber: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewControllerWithIdentifier("Column\(tempColumnNumber)VC")
    }
    
    func ticketCreationVCDidFinish(ticketCreationVC: TicketCreationTableViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PageViewControllerEmbedSegue" {
            pageViewController = segue.destinationViewController as! UIPageViewController
            pageViewController.dataSource = self
            pageViewController.delegate = self
            
            if let firstViewController = orderedViewControllers.first {
                pageViewController.setViewControllers([firstViewController],
                                                      direction: .Forward,
                                                      animated: true,
                                                      completion: nil)
                
            }
        } else {
            super.prepareForSegue(segue, sender: sender)
        }
    }
    
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl = UIPageControl(frame: CGRect(x: 100.0, y: self.view.frame.height - 100.0, width: self.view.frame.width - 200.0, height: 100.0))
        pageControl.numberOfPages = orderedViewControllers.count
        view.addSubview(pageControl)
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: Properties
    var pageViewController: UIPageViewController!
    var pageControl: UIPageControl!
    
    // TODO: How do I bring in core data to set the values?
    // TODO: How do I create a variable amount of column instantiations?
    // MARK: Hard-coded page views - REMOVE
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColumnVC("Column One", columnTicketCount: nil, tempColumnNumber: "1"),
                self.newColumnVC("Column Two", columnTicketCount: nil, tempColumnNumber: "2"),
                self.newColumnVC("Column Three", columnTicketCount: nil, tempColumnNumber: "3")]
    }()
}
