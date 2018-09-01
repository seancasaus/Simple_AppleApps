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
    
    struct sliderVariables {
        static var height:Int = 0
        static var weight:Int = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //button click
    @IBAction func calculateBMI(_ sender: Button) {
        
        //height and weight must both be doubles
        if let height = Double(self.heightField.text!) {
            if let weight = Double(self.weightField.text!) {
                
                //BMI formula
                let BMI = (weight / (height) / (height)) * 703
                //set BMI text field
                bmiField.text = String.localizedStringWithFormat("%.2f %@", BMI, "")
                
                //out put messages, change color
                if BMI < 18 {
                    classificationField.textColor = UIColor.blue
                    classificationField.text = "You are underweight"
                }else if BMI >= 18 && BMI < 25 {
                    classificationField.textColor = UIColor.green
                    classificationField.text = "You are normal"
                }else if BMI >= 25 && BMI < 30 {
                    classificationField.textColor = UIColor.purple
                    classificationField.text = "You are pre-obese"
                }else {
                    classificationField.textColor = UIColor.red
                    classificationField.text = "You are obese"
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
    
    func sliderController() {
        //print("\(sliderVariables.height) | \(sliderVariables.weight)")
        let height:Int = sliderVariables.height
        let weight:Int = sliderVariables.weight
        
        
        heightSliderLabel.text = String(height)
        weightSliderLabel.text = String(weight)
        
        if height != 0 && weight != 0 {
            let BMI:Double = (Double(weight) / Double(height) / Double(height)) * 703
            
            if BMI <= 50 && BMI >= 8 {
                bmiSliderLabel.text = String.localizedStringWithFormat("%.2f %@", BMI, "")
            }
            else {
                bmiSliderLabel.text = "###"
            }
        }
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        sliderVariables.height = Int(sender.value)
        sliderController()
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        sliderVariables.weight = Int(sender.value)
        sliderController()
    }
    
    
}


