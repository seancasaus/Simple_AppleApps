//
//  moonVC.swift
//  Space Walk
//
//  Created by Sean Casaus on 9/14/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class moonVC: UIViewController {
    @IBOutlet weak var earthLabel: UILabel!
    @IBOutlet weak var moonLabel: UILabel!
    @IBOutlet weak var outputMessage: UILabel!
    
    var earthWeight:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(earthWeight)
        
        if earthWeight >= 0 {
            earthLabel.text = "\(String(format: "%.2f", earthWeight)) lb"
            moonLabel.text = "\(String(format: "%.2f",  (earthWeight * (0.16667)))) lb"
            outputMessage.text = "I feel much lighter!"
        }
        else {
            earthLabel.text = "---"
            moonLabel.text = "---"
            outputMessage.text = "Woops...You Entered an Invalid Entry. Go back and try again!"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let jupiterVC = segue.destination as? jupiterVC {
            if earthWeight >= 0{
                jupiterVC.earthWeight = earthWeight
            }else {
                jupiterVC.earthWeight = -1.00
            }
        }else {
            return
        }
    }
}
