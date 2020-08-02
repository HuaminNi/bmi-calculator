//
//  calculatorBrain.swift
//  handles all of the logic of bmi
//  BMI Calculator
//
//  Created by huaminni on 8/1/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBrain {
    var bmi : BMI?
    
    mutating func calculateBMI(weight: Float, height:Float) {
        let bmifloat = weight / pow(height, 2)
        if bmifloat < 18.5 {
            bmi = BMI(value: bmifloat, advice: "Eat more pies!", color: UIColor.blue) //也可以用color literal在调色盘里选 //一旦有了一个bmivalue，我们不希望改变它，而是新建一个structure
        }else if bmifloat < 24.9 {
            bmi = BMI(value: bmifloat, advice: "Fit as a fiddle!", color: UIColor.green)
        }else {
            bmi = BMI(value: bmifloat, advice: "Eat less pies!", color: UIColor.red)
        }
        
    }
    
    func getBMI() -> String {
        let bmiValue = String(format: "%0.1f", bmi?.value ?? 0.0)
        return bmiValue
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
        
