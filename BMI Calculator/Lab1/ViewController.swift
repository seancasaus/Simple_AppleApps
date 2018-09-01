//
//  ViewController.swift
//  Lab1
//
//  Created by Sean Casaus on 8/31/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //View 1 components
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bmiField: UILabel!
    @IBOutlet weak var classificationField: UILabel!
    
    //slider view components
    @IBOutlet weak var heightSliderLabel: UILabel!
    @IBOutlet weak var weightSliderLabel: UILabel!
    @IBOutlet weak var bmiSliderLabel: UILabel!
    @IBOutlet weak var outputSliderMessage: UILabel!
    
    //sliders update these variables
    struct sliderVariables {
        static var height:Int = 0
        static var weight:Int = 0
    }
    
    //button click
    @IBAction func calculateBMI(_ sender: Button) {
        
        //height and weight must both be doubles
        if let height = Double(self.heightField.text!) {
            if let weight = Double(self.weightField.text!) {
                
                //BMI formula
                let BMI = (weight / (height) / (height)) * 703
                //set BMI text field
                if BMI >= 8 && BMI <= 50 {
                    bmiField.text = String.localizedStringWithFormat("%.2f %@", BMI, "")
                }
                else {
                    bmiField.text = "###"
                }
                
                //out put messages, change color
                if BMI < 18 && BMI >= 8{
                    classificationField.textColor = UIColor.blue
                    classificationField.text = "You are underweight"
                }else if BMI >= 18 && BMI < 25 {
                    classificationField.textColor = UIColor.green
                    classificationField.text = "You are normal"
                }else if BMI >= 25 && BMI < 30 {
                    classificationField.textColor = UIColor.purple
                    classificationField.text = "You are pre-obese"
                }else if BMI >= 30 && BMI <= 50{
                    classificationField.textColor = UIColor.red
                    classificationField.text = "You are obese"
                }else {
                    classificationField.textColor = UIColor.black
                    classificationField.text = "Out of Bounds"
                }
            }
            else {
                bmiField.text = "Please enter a number!"
            }
        }
        else {
            bmiField.text = "Please enter a number!"
        }
    }
    
    //called every time a slider is changed
    func sliderController() {
        //set height and weight
        let height:Int = sliderVariables.height
        let weight:Int = sliderVariables.weight
        
        //update labels under sliders
        heightSliderLabel.text = String(height)
        weightSliderLabel.text = String(weight)
        
        //ensures not division by 0
        if height != 0 && weight != 0 {
            let BMI:Double = (Double(weight) / Double(height) / Double(height)) * 703
            
            //set bounds so there's no extremly large values
            if BMI <= 50 && BMI >= 8 {
                //output BMI
                bmiSliderLabel.text = String.localizedStringWithFormat("%.2f %@", BMI, "")
                
                //control flow for output messages
                if BMI < 18 {
                    outputSliderMessage.textColor = UIColor.blue
                    outputSliderMessage.text = "You are underweight"
                }
                else if BMI >= 18 && BMI < 25 {
                    outputSliderMessage.textColor = UIColor.green
                    outputSliderMessage.text = "You are normal"
                }else if BMI >= 25 && BMI < 30 {
                    outputSliderMessage.textColor = UIColor.purple
                    outputSliderMessage.text = "You are pre-obese"
                }else {
                    outputSliderMessage.textColor = UIColor.red
                    outputSliderMessage.text = "You are obese"
                }
            }
            //error handling for out of bounds
            else {
                bmiSliderLabel.text = "###"
                outputSliderMessage.text = "Out Of Bounds"
                outputSliderMessage.textColor = UIColor.black
            }
        }
    }
    
    //listeners for sliders
    @IBAction func heightSlider(_ sender: UISlider) {
        sliderVariables.height = Int(sender.value)
        sliderController()
    }
    
    //listeners for sliders
    @IBAction func weightSlider(_ sender: UISlider) {
        sliderVariables.weight = Int(sender.value)
        sliderController()
    }
}


