//
//  ViewController.swift
//  Space Walk
//
//  Created by Sean Casaus on 9/14/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let moonVC = segue.destination as? moonVC {
            if isStringDouble(string: weightTextField.text!) {
                moonVC.earthWeight = Double(weightTextField.text!)!
            } else {
                moonVC.earthWeight = -1.00
            }
        }else if let jupiterVC = segue.destination as? jupiterVC {
            if isStringDouble(string: weightTextField.text!) {
                jupiterVC.earthWeight = Double(weightTextField.text!)!
            }else {
                jupiterVC.earthWeight = -1.00
            }
        }else {
            return
        }
    }
    
    
    @IBAction func didUnwindMoon( sender: UIStoryboardSegue) {
        guard let moonVC = sender.source as? moonVC else {return}
        weightTextField.text = String(moonVC.earthWeight)
        if Double(weightTextField.text!)! < 0 {
            weightTextField.text = ""
        }
    }
    
    @IBAction func didUnwindJupiter( sender: UIStoryboardSegue) {
        guard let jupiterVC = sender.source as? jupiterVC else {return}
        weightTextField.text = String(jupiterVC.earthWeight)
        if Double(weightTextField.text!)! < 0 {
            weightTextField.text = ""
        }
    }
    
    func isStringDouble(string: String) -> Bool {
        return Double(string) != nil
    }
}

