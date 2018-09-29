//
//  CityController.swift
//  TableView
//
//  Created by Sean Casaus on 9/28/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class CityController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var city:City = City(image: #imageLiteral(resourceName: "paris"), title: "Paris", description: "Paris, the largest city and capital of France, was founded in 52 BC and is known as the City of Lights.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
    }
}

extension CityController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = self.city
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell2") as! CityCell
        cell.setCityCell(city: city)
        
        return cell
    }
}
