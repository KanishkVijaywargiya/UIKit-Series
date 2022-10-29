//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Kanishk Vijaywargiya on 29/10/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

enum Values {
    case Underweight
    case normal
    case overWeight
}

struct CalculatorBrain {
    //var bmi: Float?
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.2f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        bmi?.advice ?? "Don't take tension, just enjoy!"
    }
    
    func getColor() -> UIColor {
        bmi?.color ?? .blue
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        switch bmiValue {
        case 0..<18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .systemBlue)
        case 18.5..<24.9:
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        case 25...:
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: .red)
        default:
            print("Over Weight")
        }
    }
}

/***
 Underweight <= 18.5
 normal = 18.5 - 24.9
 over weight = 25
 ***/

/**
 5 different ways of working with Swift
 -----------------------------------------------
 1]. Force Unwrapping :- Optional !
 
 2]. Check for nil value :-
 if optional != nil {
 optional !
 }
 
 3]. Optional Binding :-
 if let safeOptional = optional {
 safeOptional
 }
 
 4]. Nil Coalescing Operator :- optional ?? defaultValue
 
 5]. Optional Chaining :- optional ?.property   optional ?.method()
 
 */
