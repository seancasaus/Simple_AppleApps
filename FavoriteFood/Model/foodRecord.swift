//
//  foodRecord.swift
//  FavoriteFood
//
//  Created by Sean Casaus on 9/8/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import Foundation

class foodRecord{
    var restaurant:String? = nil
    var food:String? = nil
    
    init(r:String, f:String) {
        self.restaurant = r
        self.food = f
    }
    
    func changeRestaurant(newRestaurant:String) {
        self.restaurant = newRestaurant
    }
}
