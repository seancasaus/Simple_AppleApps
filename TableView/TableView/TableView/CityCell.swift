//
//  CityCell.swift
//  TableView
//
//  Created by Sean Casaus on 9/28/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityLabelView: UILabel!
    @IBOutlet weak var cityImageSecondView: UIImageView!
    @IBOutlet weak var cityLabelSecondView: UILabel!
    @IBOutlet weak var cityDescription: UILabel!
    
    func setCell(city: City) {
        cityImageView.image = city.image
        cityLabelView.text = city.title
    }
    
    func setCityCell(city: City) {
        cityImageSecondView.image = city.image
        cityLabelSecondView.text = city.title
        cityDescription.text = city.title
    }
    

}
