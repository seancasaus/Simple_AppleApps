//
//  dictionary.swift
//  FavoriteFood
//
//  Created by Sean Casaus on 9/8/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import Foundation

class dictionary
{
    var foodRepository : [String:foodRecord] = [String:foodRecord] ()
    init(){}
    
    //add an item to the foodRepository based off of food name
    func add(f:foodRecord)
    {
        print("adding" + f.food!)
        foodRepository[f.food!] = f
    }
    
    //search and return the foodRecord in the food repository
    func search(f:String) -> foodRecord?
    {
        var found = false
        
        for (food, _) in foodRepository
        {
            if food == f {
                found = true
                break
            }
        }
        if found
        {
            return foodRepository[f]
        }else  {
            
            return nil
        }
    }
    
    func iterateBackward(f:String) -> foodRecord? {
        var foundItem = false
        
        for (food, _) in foodRepository.reversed() {
            print(food)
            if foundItem {
                return foodRepository[food]
            }
            else {
                if food == f {
                    foundItem = true
                }
            }
        }
        return foodRepository[f]
    }
    
    func iterateForward(f:String) -> foodRecord? {
        var foundItem = false
        
        for (food, _) in foodRepository {
            print(food)
            if foundItem {
                return foodRepository[food]
            }
            else {
                if food == f {
                    foundItem = true
                }
            }
        }
        return foodRepository[f]
    }
    
    func edit(f:String, r:String) -> Bool {
        if foodRepository[f] == nil {
            print("\(f) was not found")
            return false
        }
        else {
            foodRepository[f]?.restaurant = r
            print("\(f) was changed")
            return true
        }
    }
    
    //delete a food item
    func delete(f:String) -> Bool
    {
        if foodRepository[f] == nil {
            print("\(f) was not found")
            return false
        }
        else {
            foodRepository[f] = nil
            print("\(f) was deleted")
            return true
        }
    }
}
