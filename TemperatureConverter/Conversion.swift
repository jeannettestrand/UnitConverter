//
//  conversions.swift
//  TemperatureConverter
//
//  Created by Jeannette on 2018-02-18.
//  Copyright © 2018 Jeannette. All rights reserved.
//

import UIKit
import os

//class PropertyKey {
//    static let name = "name"
//    static let unit1 = "unit1"
//    static let unit2 = "unit2"
//}

class Conversion {
    var name: String
    var unit1Name: String
    var unit1: Double
    var unit2Name: String
    var unit2: Double
    
    
    //MARK : Initialization
    
    init?(name:String, unit1Name: String, unit1: Double, unit2Name: String, unit2: Double) {
        if name.isEmpty || unit1 < 0 || unit2 < 0 {
            return nil
        }
        self.name = name
        self.unit1Name = unit1Name
        self.unit1 = unit1
        self.unit2Name = unit2Name
        self.unit2 = unit2
    }
}
