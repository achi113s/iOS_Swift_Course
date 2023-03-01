//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Giorgio Latour on 2/28/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    let colors = ["underweight": #colorLiteral(red: 0.7294117647, green: 0.8431372549, blue: 0.9137254902, alpha: 1), "normal": #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), "overweight": #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)]
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: colors["underweight"]!)
        } else if bmiValue < 25 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: colors["normal"]!)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: colors["overweight"]!)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice!"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
}
