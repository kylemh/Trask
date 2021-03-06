//
//  ColorSelectorTableViewCell.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/21/16.
//
//

import UIKit

class ColorSelectorTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    // MARK: View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let pickerView = UIPickerView()
        let toolbar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: 44.0))
        
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil), UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(ColorSelectorTableViewCell.pickerDidFinish(_:)))]
        
        colorTextField.inputView = pickerView
        colorTextField.inputAccessoryView = toolbar
        
        colorSelection = colorPickerData.first
        colorTextField.text = colorSelection
        
        colorTextField.tintColor = UIColor.clearColor() //no cursor for textfield

        pickerView.delegate = self
        pickerView.dataSource = self
    }

    
    // MARK: Picker Functions
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorPickerData[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorPickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        colorSelection = colorPickerData[row]
        colorTextField.text = colorSelection
    }
    
    dynamic func pickerDidFinish(sender: AnyObject) {
        endEditing(true)
    }
    
    
    // MARK: Properties
    @IBOutlet weak var colorTextField: UITextField!
    let colorPickerData = ["Black", "White", "Red", "Blue", "Green", "Yellow", "Purple"]
    var colorSelection: String!
}
