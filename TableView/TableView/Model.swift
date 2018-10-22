//
//  City.swift
//  TableView
//
//  Created by Sean Casaus on 9/28/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import Foundation
import UIKit

class Model {
    var cityArray:[City] = []
    
    init() {
        addCity(name: "Paris", desc: "Paris, the largest city and capital of France, was founded in 52 BC and is known as the City of Lights.", image: #imageLiteral(resourceName: "paris"))
        addCity(name: "Austin", desc: "Austin, the capital of Texas, was founded in 1835 and is known as the Live Music Capital of the world.", image: #imageLiteral(resourceName: "austin"))
        addCity(name: "San Diego", desc: "San Diego, the 3rd largest metropolitan area in California, was founded in 1769 and is known for its' laid back vibes and surf culture.", image: #imageLiteral(resourceName: "sanDiego"))
        addCity(name: "Tampa", desc: "Tampa, the second largest metropolitan area in Florida, was founded in 1849 and is known for its' Cuban heritage and importance in the Cigar industry.", image: #imageLiteral(resourceName: "tampa"))
        addCity(name: "Seattle", desc: "Seattle, the largest city in the Pacific North West, was founded in 1869 and is known as the Emerald City.", image: #imageLiteral(resourceName: "seattle"))
    }
    
    func addCity(name: String, desc: String, image: UIImage) {
        let newCity = City(image: image, title: name, description: desc)
        cityArray.append(newCity)
    }
    
    func deleteCity(x: Int) {
        cityArray.remove(at: x)
    }
    
    func sizeOfArray() -> Int {
        return cityArray.count
    }
}

class City {
    var image: UIImage
    var title: String
    var description: String
    
    init(image: UIImage, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
}
