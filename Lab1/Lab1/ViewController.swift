//
//  ViewController.swift
//  Lab1
//
//  Created by Sean Casaus on 8/31/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var bmiField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateBMI(_ sender: Button) {
        if let height = Double(self.heightField.text!) {
            if let weight = Double(self.weightField.text!) {
                //String.localizedStringWithFormat("%.2f %@", value, unit)
                print(height)
                print(weight)
                
                let BMI = (weight / (height) / (height)) * 703
                bmiField.text = String.localizedStringWithFormat("%.2f %@", BMI, "")
            }
            else {
                bmiField.text = "Please enter a number!"
            }
        }
        else {
            bmiField.text = "Please enter a number!"
        }
    }
    
}

