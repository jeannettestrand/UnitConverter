//
//  ViewController.swift
//  TemperatureConverter
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
    // Button A invokes the closureA to convert units
    @IBAction func buttonA(_ sender: UIButton) {
        let value = Double(self.valField.text!)
        self.valResult.text = ((value) != nil) ? String(item!.closureA(value!)) : "N/A"
    }
    // Button B invokes the closureB to convert units
    @IBAction func buttonB(_ sender: UIButton) {
        let value = Double(self.valField.text!)
        self.valResult.text = ((value) != nil) ? String(item!.closureB(value!)) : "N/A"
    }
    
    // MARK: Delegate Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let item = item {
            self.valField.delegate = self
            nameLabel.text = item.nameLabel
            buttonA.setTitle(item.buttonLabelA, for: UIControlState.normal)
            buttonB.setTitle(item.buttonLabelB, for: UIControlState.normal)
        } else {
            nameLabel.text = "Error"
            buttonA.setTitle("N/A", for: UIControlState.normal)
            buttonB.setTitle("N/A", for: UIControlState.normal)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.valField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    

}

