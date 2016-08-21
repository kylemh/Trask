//
//  TicketCreationTableViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/20/16.
//
//

import UIKit

class TicketCreationTableViewController: UITableViewController, UITextFieldDelegate {
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker(frame: CGReactZero)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: View Mangement
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if selectedTicket != nil {
            navigationItem.title = "Edit Ticket #(\selectedTicket."
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Initialization
    required init!(coder aDecoder: NSCoder) {
        let now = NSDate()
        dateBorrowed = now
        let dateComponents = NSDateComponents()
        dateComponents.weekOfYear = 2
        if let later = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: now, options: []) {
            dateToReturn = later
        }
        else {
            dateToReturn = now
        }
        
        super.init(coder: aDecoder)
    }
    
    // MARK: Properties (Public)
    var selectedColumn: Column!
    var selectedTicket: Ticket? {
        didSet {
            if let someTicket = selectedTicket {
                //Required
                ticketTitle = someTicket.ticketTitle
                ticketNumber = someTicket.ticketNumber
                ticketCreationDate = someTicket.ticketCreationDate
                
                //Optional
                
                ticketAssignee = someTicket.ticketAssignee
                ticketComments = someTicket.ticketComments
                ticketDetail = someTicket.ticketDetail
                ticketLabel = someTicket.ticketLabel
                ticketMilestone = someTicket.ticketMilestone
                
                
            }
        }
    }
    
    var delegate: TicketCreationTableViewControllerDelegate!
    
    // MARK: Properties (Private)
    //private var ticketName: String
    private var milestoneDate: NSDate
    private var groupingLabel: String?
    //private var assignee: String?
    
    private var datePicker: UIDatePicker!
    private var dateFormatter = NSDateFormatter()
    
    // MARK: Properties (IBOutlet)
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var commentsTextField: UITextField!
    @IBOutlet weak var milestoneLabel: UILabel!
    @IBOutlet weak var milestoneTextField: UITextField!
    @IBOutlet weak var groupingDetailLabel: UILabel!
    @IBOutlet weak var assigneeTextField: UITextField!
    
    private enum CreateTicketRows {
        case Title
        case Description
        case Comments
        case MilestoneDate
        case GroupingLabel
        case Assignee
        
        static let Form: Array<CreateTicketRows> = [.Title, .Description, .Comments, .MilestoneDate, .GroupingLabel, .Assignee]
    }
}
