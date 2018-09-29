//
//  ViewController.swift
//  TableView
//
//  Created by Sean Casaus on 9/28/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var citys:[City] = []
    var currentCity:City = City(image: #imageLiteral(resourceName: "seattle"), title: "", description: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        citys = createArray()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getCity() -> City {
        return currentCity
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        currentCity = citys[indexPath.row]
    }
    
    func createArray() -> [City] {
        var tempCity: [City] = []
        
        let city1 = City(image: #imageLiteral(resourceName: "paris"), title: "Paris", description: "Paris, the largest city and capital of France, was founded in 52 BC and is known as the City of Lights.")
        let city2 = City(image: #imageLiteral(resourceName: "austin"), title: "Austin", description: "Austin, the capital of Texas, was founded in 1835 and is known as the Live Music Capital of the world.")
        let city3 = City(image: #imageLiteral(resourceName: "sanDiego"), title: "San Diego", description: "San Diego, the 3rd largest metropolitan area in California, was founded in 1769 and is known for its' laid back vibes and surf culture.")
        let city4 = City(image: #imageLiteral(resourceName: "tampa"), title: "Tampa", description: "Tampa, the second largest metropolitan area in Florida, was founded in 1849 and is known for its' Cuban heritage and importance in the Cigar industry.")
        let city5 = City(image: #imageLiteral(resourceName: "seattle"), title: "Seattle", description: "Seattle, the largest city in the Pacific North West, was founded in 1869 and is known as the Emerald City.")
        
        tempCity.append(city1)
        tempCity.append(city2)
        tempCity.append(city3)
        tempCity.append(city4)
        tempCity.append(city5)
        
        return tempCity
    }
}

protocol myProtocol {
    func getCity() -> Int
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = citys[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as! CityCell
        cell.setCell(city: city)
        
        return cell
    }
}

