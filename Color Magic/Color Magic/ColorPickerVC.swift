//
//  ColorPickerVC.swift
//  Color Magic
//
//  Created by Sean Casaus on 8/14/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class ColorPickerVC: UIViewController {
    
    var delegate: ColorTransferDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //gets button information
    @IBAction func colorBtnWasPressed(sender: UIButton) {
        if delegate != nil {
            delegate?.userDidChoose(color: sender.backgroundColor!, withName: sender.titleLabel!.text!)
            self.navigationController?.popViewController(animated: true) //goes back to previous view controller
        }
    }
}
