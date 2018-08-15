//
//  ColorTransferDelegate.swift
//  Color Magic
//
//  Created by Sean Casaus on 8/14/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import Foundation
import UIKit

protocol ColorTransferDelegate {
    func userDidChoose(color: UIColor, withName colorName: String)
}
