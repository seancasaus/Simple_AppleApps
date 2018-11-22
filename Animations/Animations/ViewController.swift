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
    @IBOutlet weak var winLabel: UILabel!
    
    var timer : Timer?
    var counter: Float  = 0.0
    var didWin: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer();
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.count), userInfo: nil, repeats: true)
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
        if (counter <= 10.0 && apple1.isHidden == true && apple2.isHidden == true && apple3.isHidden == true && apple4.isHidden == true) {
            didWin = true
            winLabel.text = "You Won"
        }
        if (counter > 10.0 && didWin == false) {
            winLabel.text = "You Lose"
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
        if (counter <= 10.0 && apple1.isHidden == true && apple2.isHidden == true && apple3.isHidden == true && apple4.isHidden == true) {
            didWin = true
            winLabel.text = "You Won"
        }
        if (counter > 10.0 && didWin == false) {
            winLabel.text = "You Lose"
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
        if (counter <= 10.0 && apple1.isHidden == true && apple2.isHidden == true && apple3.isHidden == true && apple4.isHidden == true) {
            didWin = true
            winLabel.text = "You Won"
        }
        if (counter > 10.0 && didWin == false) {
            winLabel.text = "You Lose"
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
        if (counter <= 10.0 && apple1.isHidden == true && apple2.isHidden == true && apple3.isHidden == true && apple4.isHidden == true) {
            didWin = true
            winLabel.text = "You Won"
        }
        if (counter > 10.0 && didWin == false) {
            winLabel.text = "You Lose"
        }
    }
    
    func viewIntersectsView(_ first_View: UIView, second_View:UIView) -> Bool {
        return first_View.frame.intersects(second_View.frame)
    }
    
    @objc func count() {
        counter = counter + 0.1
        timerLabel.text  = String(format: "%.01f", counter)
    }
}

