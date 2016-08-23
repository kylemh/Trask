//
//  ColorSelectorTableViewCell.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/21/16.
//
//

import UIKit

class ColorSelectorTableViewCell: UITableViewCell {

    @IBOutlet weak var colorTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let pickerView = UIPickerView()
        colorTextField.inputView = pickerView
        
//        datePicker = UIDatePicker(frame: CGRectZero)
//        datePicker.datePickerMode = .DateAndTime
//        datePicker.addTarget(self, action: #selector(LentItemDetailViewController.datePickerDidChange(_:)), forControlEvents: .ValueChanged)
//        let toolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 44.0))
//        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil), UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(LentItemDetailViewController.datePickerDidFinish(_:)))]
//        dateBorrowedTextField.inputView = datePicker
//        dateBorrowedTextField.inputAccessoryView = toolbar
//        dateToReturnTextField.inputView = datePicker
//        dateToReturnTextField.inputAccessoryView = toolbar
//        
//        dateFormatter.dateStyle = .LongStyle
//        dateFormatter.timeStyle = .MediumStyle
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
