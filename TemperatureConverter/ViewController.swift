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
        var display = "N/A"
        if let value = Double(self.valField.text!) {
            if let result = item!.closureA(value) {
                display = String(result)
            }
        }
        self.valResult.text = display
    }
    
    // Invokes closureB to convert units
    @IBAction func buttonBAction(_ sender: UIButton) {
        var display = "N/A"
        if let value = Double(self.valField.text!) {
            if let result = item!.closureB(value) {
                display = String(result)
            }
        }
        self.valResult.text = display
    }
    
    // Handles view initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        // Retrieves data passed from table view controller
        
        // Initializes data for the view controller, if error encountered fatalError message sent
        if let item = item {
            self.valField.delegate = self
            nameLabel.text = item.nameLabel
            buttonA.setTitle(item.buttonLabelA, for: UIControlState.normal)
            buttonB.setTitle(item.buttonLabelB, for: UIControlState.normal)
        } else {
            fatalError("Unable to open view controller")
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

