//
//  ColumnTableViewCell.swift
//  FinalProject
//
//  Created by Kyle Holmberg on 8/24/16.
//
//

import UIKit

class ColumnTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var columnTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        columnTextField.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
