//
//  TicketCreationTableViewController.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/20/16.
//
//

import UIKit

class TicketCreationTableViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.lightGrayColor()
        
        groupingPicker.dataSource = self
        groupingPicker.delegate = self
        
        dpShowDate()
        groupingLabel.text = groupingOptions[0]
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
    
    
    // MARK: Table View Functions
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (CreateTicketSections.AllSections[indexPath.section] == .Logistics) {
            if (LogisticsRows.AllRows[indexPath.row] == .MilestoneDateLabel) {
                dpVisibleToggle()
                dpShowDate()
            } else if (LogisticsRows.AllRows[indexPath.row] == .GroupingLabel) {
                pvVisibleToggle()
            }
        }

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (!dpShowDateVisible && CreateTicketSections.AllSections[indexPath.section] == .Logistics && LogisticsRows.AllRows[indexPath.row] == .MilestoneDataPicker) {
            return 0 // No height for Date Picker when dpShowDateVisible boolean is false
        } else if (!pvShowOptionsVisible && CreateTicketSections.AllSections[indexPath.section] == .Logistics && LogisticsRows.AllRows[indexPath.row] == .GroupingPicker) {
            return 0 // No height for Picker when pvShowOptionsVisible boolean is false
        } else {
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    
    
    // MARK: Date Picker Functions
    // Toggle Date Picker Hidden Boolean Function
    private func dpVisibleToggle() {
        dpShowDateVisible = !dpShowDateVisible
        ticketCreationTableView.beginUpdates()
        ticketCreationTableView.endUpdates()
    }
    
    // Milestone Label Function
    private func dpShowDate() {
        milestoneLabel.text = NSDateFormatter.localizedStringFromDate(milestoneDatePicker.date, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.NoStyle)
    }
    
    
    // MARK: Picker View Functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return groupingOptions.count
    }
    
    // Toggle Picker Hidden Boolean Function
    private func pvVisibleToggle() {
        pvShowOptionsVisible = !pvShowOptionsVisible
        ticketCreationTableView.beginUpdates()
        ticketCreationTableView.endUpdates()
    }
    
    // Populate Picker Rows
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return groupingOptions[row]
    }
    
    // Change Label Given Selected Row
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        groupingLabel.text = groupingOptions[row]
    }
    
    
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
            if let someTicket = selectedTicket { // Editing a ticket
                // TODO: Fetched Property: ticketNumber... how do I set it here?
                // Required
                ticketTitle = someTicket.ticketTitle
                ticketMilestone = someTicket.ticketMilestone
                //ticketNumber = someTicket.ticketNumber
                
                // Optional
                ticketAssignee = someTicket.ticketAssignee
                ticketComments = someTicket.ticketComments
                ticketDescription = someTicket.ticketDetail
                ticketGroupingLabel = someTicket.ticketLabel
            } else { // Creating a ticket
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
    
    //MARK: Delegates
    //var delegate: TicketCreationTableViewControllerDelegate!
    
    
    
    // MARK: Properties (Private)
    // TODO: Do I need to include variables for optional fields?
    // Required
    private var ticketTitle: String
    private var ticketMilestone: NSDate
    
    // Optional
    private var ticketGroupingLabel: String?
    private var ticketAssignee: String?
    private var ticketDescription: String?
    private var ticketComments: String?
    private var datePicker: UIDatePicker!
    private var dateFormatter = NSDateFormatter()
    private var dpShowDateVisible = false
    private var pvShowOptionsVisible = false
    
    // MARK: Properties (IBOutlet)
    // Table Outlet
    @IBOutlet weak private var ticketCreationTableView: UITableView!
    
    // Text Fields
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var commentsTextField: UITextField!
    @IBOutlet weak var assigneeTextField: UITextField!
    
    // Labels
    @IBOutlet weak var milestoneLabel: UILabel!
    @IBOutlet weak var groupingLabel: UILabel!
    
    // Pickers
    @IBOutlet var milestoneDatePicker: UIDatePicker!
    @IBOutlet var groupingPicker: UIPickerView!
    
    // MARK: IBAction
    @IBAction func milestoneDataPickerShow(sender: UIDatePicker) {
        dpShowDate()
    }
    
    // TODO: No Default Value
    // I don't want to have default values for required fields - I'd like to just have placeholder text when I create a ticket.
    private static let DefaultTitle = "Unnamed Ticket"
    private static let DefaultMilestone = NSDate()
    
    private enum CreateTicketSections {
        case Details
        case Logistics
        
        static let AllSections: Array<CreateTicketSections> = [.Details, .Logistics]
    }
    
    private enum DetailRows {
        case Title
        case Description
        case Comments
        
        static let AllRows: Array<DetailRows> = [.Title, .Description, .Comments]
    }
    
    private enum LogisticsRows {
        case MilestoneDateLabel
        case MilestoneDataPicker
        case GroupingLabel
        case GroupingPicker
        case Assignee
        
        static let AllRows: Array<LogisticsRows> = [.MilestoneDateLabel, .MilestoneDataPicker, .GroupingLabel, .GroupingPicker, .Assignee]
    }
    
    let groupingOptions = ["None", "Bug", "Duplicate", "Enhancement", "Help Wanted", "In Progress", "Invalid", "Question", "Ready", "High Priority", "Low Priority"]
}