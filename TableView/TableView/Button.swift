//
//  Button.swift
//  TableView
//
//  Created by Sean Casaus on 10/28/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    //button
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.green.cgColor
        layer.cornerRadius = 8
        layer.opacity = 0.75
    }
}
