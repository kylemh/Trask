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
        
        //datePicker = UIDatePicker(frame: CGReactZero)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: View Mangement
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        /*
        if selectedTicket != nil {
            if let tickNum: Int = selectedTicket!.ticketNumber as Int {
                navigationItem.title = "Edit Ticket " + String(tickNum)
            }
        }
        */
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
        self.ticketTitle = TicketCreationTableViewController.DefaultTitle
        let dateComponents = NSDateComponents()
        dateComponents.weekOfYear = 2
        let tempDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: NSDate(), options: [])
        self.ticketMilestone = tempDate!
        super.init(coder: aDecoder)
    }
    
    // MARK: Properties
    var selectedColumn: Column!
    var selectedTicket: Ticket? {
        didSet {
            if let someTicket = selectedTicket { //Editing a ticket
                // TODO: Fetched Property: ticketNumber... how do I set it here?
                //Required
                ticketTitle = someTicket.ticketTitle
                ticketMilestone = someTicket.ticketMilestone
                //ticketNumber = someTicket.ticketNumber
                
                //Optional
                ticketAssignee = someTicket.ticketAssignee
                ticketComments = someTicket.ticketComments
                ticketDescription = someTicket.ticketDetail
                ticketGroupingLabel = someTicket.ticketLabel
            } else { //Creating a ticket
                ticketTitle = TicketCreationTableViewController.DefaultTitle
                let dateComponents = NSDateComponents()
                dateComponents.weekOfYear = 2
                let tempDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: NSDate(), options: [])
                ticketMilestone = tempDate!
                ticketAssignee = nil
                ticketComments = nil
                ticketDescription = nil
                ticketGroupingLabel = nil
            }
        }
    }
    
    // TODO: Get delegate to work.
    //var delegate: TicketCreationTableViewControllerDelegate!
    
    // MARK: Properties (Private)
    // TODO: Do I need to include variables for optional fields?
    //Required
    private var ticketTitle: String
    private var ticketMilestone: NSDate
    
    //Optional
    private var ticketGroupingLabel: String?
    private var ticketAssignee: String?
    private var ticketDescription: String?
    private var ticketComments: String?
    
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
    
    // TODO: No Default Value
    // I don't want to have default values for required fields - I'd like to just have placeholder text when I create a ticket.
    private static let DefaultTitle = "Unnamed Ticket"
    private static let DefaultMilestone = NSDate()
    
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
