//
//  ViewController.swift
//  Manages view controller drawing, management, button pressing, navigation back to tabl view.
//
//  Created by Jeannette on 2018-01-25.
//  Copyright © 2018 Jeannette. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var valField: UITextField!
    @IBOutlet weak var valResult: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    var item: Conversion?
    
    
    // Mark: Methods
    // Invokes closureA to convert units
    @IBAction func butonAAction(_ sender: UIButton) {
        var result = "Invalid Entry"
        if let value = Double(self.valField.text!) {
            if (value < 0.0 && nameLabel.text != "Temperature Converter") {
                result = "Value must be positive"
            } else {
                result = String(item!.closureA(value))
            }
        }
        self.valResult.text = result
    }
    
    // Invokes closureB to convert units
    @IBAction func buttonBAction(_ sender: UIButton) {
        var result = "Invalid Entry"
        if let value = Double(self.valField.text!) {
            if (value < 0.0 && nameLabel.text != "Temperature Converter") {
                result = "Value must be positive"
            } else {
                result = String(item!.closureB(value))
            }
        }
        self.valResult.text = result
    }
    
    // Handles view initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        // Retrieves data passed from table view controller
        if let item = item {
            self.valField.delegate = self
            nameLabel.text = item.nameLabel
            buttonA.setTitle(item.buttonLabelA, for: UIControlState.normal)
            buttonB.setTitle(item.buttonLabelB, for: UIControlState.normal)
        } else {
            // error state, will display error messages in view controller
            self.valField.delegate = self
            nameLabel.text = "error"
            buttonA.setTitle("error", for: UIControlState.normal)
            buttonB.setTitle("error", for: UIControlState.normal)
        }
    }
    
    // Handles back button actions
    @IBAction func cancel(_ sender: Any) {
        if presentingViewController is UINavigationController {
            // Add
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            // Edit
            owningNavigationController.popViewController(animated: true)
        }
    }
    
    // Clear text field when it receives focus
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.valField.resignFirstResponder()
        return true
    }
    
    // Handles memory issues
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

  
    

}

