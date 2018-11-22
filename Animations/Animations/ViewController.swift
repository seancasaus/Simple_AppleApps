//
//  ViewController.swift
//  Animations
//
//  Created by Sean Casaus on 11/21/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var monkey: UILabel!
    @IBOutlet weak var apple1: UILabel!
    @IBOutlet weak var apple2: UILabel!
    @IBOutlet weak var apple3: UILabel!
    @IBOutlet weak var apple4: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer : Timer?
    var counter  = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer();
        
    }

    @IBAction func upButton(_ sender: UIButton) {
        var frame  = self.monkey.frame
        frame.origin.y -= 10
        self.monkey.frame =  frame
        
        if(viewIntersectsView(monkey, second_View: apple1)) {
            self.apple1.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple2)) {
            self.apple2.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple3)) {
            self.apple3.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple4)) {
            self.apple4.isHidden = true
        }
    }
    @IBAction func rightButton(_ sender: UIButton) {
        var frame  = self.monkey.frame
        frame.origin.x += 10
        self.monkey.frame =  frame
        
        if(viewIntersectsView(monkey, second_View: apple1)) {
            self.apple1.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple2)) {
            self.apple2.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple3)) {
            self.apple3.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple4)) {
            self.apple4.isHidden = true
        }
    }
    @IBAction func downButton(_ sender: UIButton) {
        var frame  = self.monkey.frame
        frame.origin.y += 10
        self.monkey.frame =  frame
        
        if(viewIntersectsView(monkey, second_View: apple1)) {
            self.apple1.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple2)) {
            self.apple2.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple3)) {
            self.apple3.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple4)) {
            self.apple4.isHidden = true
        }
    }
    @IBAction func leftButton(_ sender: UIButton) {
        var frame  = self.monkey.frame
        frame.origin.x -= 10
        self.monkey.frame =  frame
        
        if(viewIntersectsView(monkey, second_View: apple1)) {
            self.apple1.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple2)) {
            self.apple2.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple3)) {
            self.apple3.isHidden = true
        }
        if(viewIntersectsView(monkey, second_View: apple4)) {
            self.apple4.isHidden = true
        }
    }
    
    func viewIntersectsView(_ first_View: UIView, second_View:UIView) -> Bool {
        return first_View.frame.intersects(second_View.frame)
    }
    
    func count() {
        counter = counter + 1
        timerVal.text  = String( counter)
    }
}

