//
//  BorderButton.swift
//  swoosh
//
//  Created by Sean Casaus on 8/28/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    
    //add border to buttons
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }
}
