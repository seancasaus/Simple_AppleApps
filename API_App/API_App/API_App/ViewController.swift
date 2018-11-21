//
//  ViewController.swift
//  API_App
//
//  Created by Sean Casaus on 11/5/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var cityName: UITextField!
    var lon : CLLocationDegrees = 0
    var lat : CLLocationDegrees = 0
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var magLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getInfo(_ sender: Any) {
        let cityName = self.cityName.text
        CLGeocoder().geocodeAddressString(cityName!, completionHandler:
            {(placemarks, error) in
                if error != nil {
                    print("Geocode failed: \(error!.localizedDescription)")
                } else {
                    let placemark = placemarks![0]
                    let location = placemark.location
                    let coords = location!.coordinate
                    self.lon = coords.longitude
                    self.lat = coords.latitude
                    //print("Long: \(self.lon) | Lat: \(self.lat)")
                    let north = self.lat + 10
                    let south = self.lat - 10
                    let east = self.lon - 10
                    let west = self.lon + 10
                    let urlAsString = "http://api.geonames.org/earthquakesJSON?north="+String(format:"%f", north)+"&south="+String(format:"%f", south)+"&east="+String(format:"%f", east)+"&west="+String(format:"%f", west)+"&username=demo"
//                    print("\(north) \(south) \(east) \(west)");
//                    print(urlAsString);
                    
                    print(urlAsString);
                    
                    let url = URL(string: urlAsString)!
                    let urlSession = URLSession.shared
                    let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
                        if (error != nil) {
                            print(error!.localizedDescription)
                        }
                        else {
                            let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
                            print(jsonResult)
                            let setOne:NSArray = jsonResult["earthquakes"] as! NSArray
                            print(setOne);
                            let y = setOne[0] as? [String: AnyObject]
                            print(y!["datetime"]!)
                            print(y!["magnitude"]!)

                            DispatchQueue.main.async {
                                self.dateLabel.text = y!["datetime"]! as? String
                                self.magLabel.text = String(format:"%.2f", (y!["magnitude"]! as? Double)!)
                            }
                        }
                    })
                    jsonQuery.resume()
                }
        })
    }
}



