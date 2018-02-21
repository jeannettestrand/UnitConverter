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
    var conversion : Conversion
    
    // Mark: Methods
    // Button A invokes the closureA to convert units
    @IBAction func buttonA(_ sender: UIButton) {
        let value = Double(self.valField.text!)
        self.valResult.text = ((value) != nil) ? String(conversion.closureA(value!)) : "N/A"
    }
    // Button B invokes the closureB to convert units
    @IBAction func buttonB(_ sender: UIButton) {
        let value = Double(self.valField.text!)
        self.valResult.text = ((value) != nil) ? String(conversion.closureB(value!)) : "N/A"
    }
    
    // MARK: Delegate Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.valField.delegate = self
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

