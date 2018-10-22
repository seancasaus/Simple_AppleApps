//
//  ViewController.swift
//  TableView
//
//  Created by Sean Casaus on 9/28/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var citys = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citys.sizeOfArray()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
        cell.textLabel?.text = citys.cityArray[indexPath.row].title
        cell.imageView?.image = citys.cityArray[indexPath.row].image
        
        return cell
    }
    
    @IBAction func addCity(_ sender: Any) {
        let addAlertController = UIAlertController(title: "Add City", message: "", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in }
        addAlertController.addAction(cancelAction)
        
        addAlertController.addTextField { (textField) in
            textField.placeholder = "Enter city name here"
            textField.keyboardType = .default
        }
        addAlertController.addTextField { (textField) in
            textField.placeholder = "Description here"
            textField.keyboardType = .default
        }
        
        self.present(addAlertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        citys.deleteCity(x: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex: IndexPath = tableView.indexPath(for: sender as! UITableViewCell)!
        if(segue.identifier == "toCityController") {
            if let destination: CityController = segue.destination as? CityController {
                destination.i = selectedIndex.row
                destination.citys = self.citys
            }
        }
    }
}
