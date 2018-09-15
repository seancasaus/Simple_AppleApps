//
//  jupiterVC.swift
//  Space Walk
//
//  Created by Sean Casaus on 9/14/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class jupiterVC: UIViewController {
    @IBOutlet weak var earthLabel: UILabel!
    @IBOutlet weak var jupiterLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    
    var earthWeight:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(earthWeight)
        
        if earthWeight >= 0 {
            earthLabel.text = "\(String(format: "%.2f", earthWeight)) lb"
            jupiterLabel.text = "\(String(format: "%.2f",  (earthWeight * (2.4)))) lb"
            outputLabel.text = "I feel much heavier!"
        }
        else {
            earthLabel.text = "---"
            jupiterLabel.text = "---"
            outputLabel.text = "Woops...You Entered an Invalid Entry. Go back and try again!"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let moonVC = segue.destination as? moonVC {
            if earthWeight >= 0{
                moonVC.earthWeight = earthWeight
            }else {
                moonVC.earthWeight = -1.00
            }
        }else {
            return
        }
    }
}
