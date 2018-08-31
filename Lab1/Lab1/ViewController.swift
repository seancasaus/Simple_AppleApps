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
        if let height = Int(self.heightField.text!) {
            if let weight = Int(self.weightField.text!) {
                print("\(height + weight)")
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

