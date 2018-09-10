//
//  ViewController.swift
//  FavoriteFood
//
//  Created by Sean Casaus on 9/8/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var restInput: UITextField!
    @IBOutlet weak var foodInput: UITextField!
    @IBOutlet weak var searchedRest: UITextField!
    @IBOutlet weak var searchedFood: UITextField!
    
    // create a dictionary object that stores the food info
    var foodDictionary:dictionary = dictionary()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func iterateBackward(_ sender: UIBarButtonItem) {
        let food = self.searchedFood.text!
        let f = self.foodDictionary.iterateBackward(f: food)
        if let x = f {
            self.searchedRest.text = x.restaurant!
            self.searchedFood.text = x.food!
        }
    }
    
    
    @IBAction func iterateForward(_ sender: UIBarButtonItem) {
        let food = self.searchedFood.text!
        let f = self.foodDictionary.iterateForward(f: food)
        if let x = f {
            self.searchedRest.text = x.restaurant!
            self.searchedFood.text = x.food!
        }
    }
    
    //edits the restaurant of a food item
    @IBAction func editFood(_ sender: Any) {
        let wasChanged = foodDictionary.edit(f: self.searchedFood.text!, r: self.searchedRest.text!)
        
        if wasChanged {
            let alertSuccess = UIAlertController(title: "Success", message: "", preferredStyle: .alert)
            let exitAction = UIAlertAction(title: "Exit", style: .cancel) {(action) in}
            alertSuccess.addAction(exitAction)
            self.present(alertSuccess, animated: true, completion: nil)
        }
        else {
            let alertFailure = UIAlertController(title: "Food Not Found", message: "", preferredStyle: .alert)
            let exitAction = UIAlertAction(title: "Exit", style: .cancel) {(action) in}
            alertFailure.addAction(exitAction)
            self.present(alertFailure, animated: true, completion: nil)
        }
    }
    
    //delete food item
    @IBAction func deleteFood(_ sender: UIBarButtonItem) {
        // show the alert controller with data input text field
        let alertController = UIAlertController(title: "Delete Food", message: "", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) {(aciton) in
            
            let text = alertController.textFields!.first!.text!
            
            if !text.isEmpty {
                let food = text
                var isDeleted = false
                isDeleted = self.foodDictionary.delete(f: food)
                
                if isDeleted == true {
                    let alertSuccess = UIAlertController(title: "Success", message: "", preferredStyle: .alert)
                    let exitAction = UIAlertAction(title: "Exit", style: .cancel) {(action) in}
                    alertSuccess.addAction(exitAction)
                    self.present(alertSuccess, animated: true, completion: nil)
                }
                else {
                    let alertFailure = UIAlertController(title: "Food Not Found", message: "", preferredStyle: .alert)
                    let exitAction = UIAlertAction(title: "Exit", style: .cancel) {(action) in}
                    alertFailure.addAction(exitAction)
                    self.present(alertFailure, animated: true, completion: nil)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {(action) in}
        
        alertController.addTextField { (textField) in
            textField.placeholder = "enter food here"
            textField.keyboardType = .decimalPad
        }
        
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //search and display food
    @IBAction func search(_ sender: UIBarButtonItem) {
        // show the alert controller with data input text field
        self.searchedRest.text = ""
        self.searchedFood.text = ""
        
        let alertController = UIAlertController(title: "Search Food", message: "", preferredStyle: .alert)
        
        let searchAction = UIAlertAction(title: "Search", style: .default) {(aciton) in
            
            let text = alertController.textFields!.first!.text!
            
            if !text.isEmpty {
                let food = text
                let f =  self.foodDictionary.search(f: food)
                if let x = f {
                    self.searchedRest.text = x.restaurant!
                    self.searchedFood.text = x.food!
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {(action) in}
        
        alertController.addTextField { (textField) in
            textField.placeholder = "enter food here"
            textField.keyboardType = .decimalPad
        }
        
        alertController.addAction(searchAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addFood(_ sender: UIBarButtonItem) {
        if let rest = restInput.text, let food = foodInput.text {
            let fRecord =  foodRecord(r:rest, f:food)
            foodDictionary.add(f: fRecord)
            self.restInput.text = ""
            self.foodInput.text = ""
        }else {
            // Alert message will be displayed to th user if there is no input
            let alert = UIAlertController(title: "Data Input Error", message: "Data Inputs are either empty or incorrect types", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}

