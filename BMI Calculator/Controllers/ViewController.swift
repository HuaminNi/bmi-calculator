//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightBar: UISlider!
    
    @IBOutlet weak var weightBar: UISlider!
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
//    var bmiValue : String?
    var calculateBrain = CalculateBrain()
    
    
    @IBAction func heightSliderChange(_ sender: UISlider) {
        let heightValue = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightValue)m"
        
    }
    
    

    @IBAction func weightSliderChange(_ sender: UISlider) {
        let weightValue = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightValue)Kg"
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let weight = weightBar.value
        let height = heightBar.value

        calculateBrain.calculateBMI(weight:weight, height:height)
        
        
 //这是在用编程实现链接两个file的情况下：
//        let secondVC = SecondViewController()
//        secondVC.bmivalue = String(format: "%0.1f", bmi)
//        self.present(secondVC, animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "toGoResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toGoResult" {
            let destinationVC = segue.destination as! ResultViewController  //使用as完成了downcasting，因为这个prepare function是被override的，一开始它被设立的时候是不知道哪个controller的，需要我们告诉它
//            destinationVC.bmiValue = bmiValue
            destinationVC.bmiValue = calculateBrain.getBMI()
            destinationVC.advice = calculateBrain.getAdvice()
            destinationVC.color = calculateBrain.getColor()
        }
    }
    
}

