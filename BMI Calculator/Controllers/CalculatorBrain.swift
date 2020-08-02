//
//  calculatorBrain.swift
//  handles all of the logic of bmi
//  BMI Calculator
//
//  Created by huaminni on 8/1/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct CalculateBrain {
    var bmiValue : String?
    
    mutating func calculateBMI(weight: Float, height:Float) {
        let bmi = weight / pow(height, 2)
        bmiValue = String(format: "%0.1f", bmi)
    }
    
    func getBMI() -> String {
        return bmiValue ?? "0.0"
    }
}
        
