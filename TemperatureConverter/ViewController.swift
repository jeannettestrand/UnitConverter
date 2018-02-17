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
    
    @IBOutlet weak var tempField: UITextField!
    @IBOutlet weak var tempResult: UITextField!
    
    // MARK: Delegate Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tempField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.tempField.resignFirstResponder()
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toF(_ sender: UIButton) {
        let temperature = Double(self.tempField.text!)
        self.tempResult.text = ((temperature) != nil) ? String(temperature! * 9.0 / 5.0 + 32.0) : "N/A"
    }
    
    @IBAction func toC(_ sender: UIButton) {
        let temperature = Double(self.tempField.text!)
        self.tempResult.text = ((temperature) != nil) ? String((temperature! - 32.0) * 5.0 / 9.0) : "N/A"
    }
    

}

