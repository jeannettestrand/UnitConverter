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
    var nameLabel: String
    var buttonLabelA: String
    var buttonLabelB: String
    var closureA: (Double) -> Double
    var closureB: (Double) -> Double
    
    //MARK : Initialization
    init?(nameLabel: String, buttonLabelA: String, buttonLabelB: String, closureA : @escaping (Double) -> Double, closureB: @escaping (Double) -> Double) {
        self.nameLabel = nameLabel
        self.buttonLabelA = buttonLabelA
        self.buttonLabelB = buttonLabelB
        self.closureA = closureA
        self.closureB = closureB
    }
}
