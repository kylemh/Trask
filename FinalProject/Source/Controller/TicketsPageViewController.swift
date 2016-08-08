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

/*
protocol TicketsPageVCDelegate: class {
    func ticketsPageVCDidFinish(ticketsVC: TicketsPageViewController)
}
*/

class TicketsPageViewController: UIPageViewController {
    @IBAction private func back(sender: AnyObject) {
        //delegate?.ticketsPageVCDidFinish(self)
    }
    
    //weak var delegate : TicketsPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
