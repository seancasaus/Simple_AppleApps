//
//  CityController.swift
//  TableView
//
//  Created by Sean Casaus on 10/21/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit
import MapKit

class CityController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descView: UILabel!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var mapType: UISegmentedControl!
    
    var i:Int?
    var citys:Model?
    
    var lon : CLLocationDegrees = 0
    var lat : CLLocationDegrees = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.text = citys?.cityArray[i!].title
        descView.text = citys?.cityArray[i!].description
        imageView.image = citys?.cityArray[i!].image
        let addressString = citys?.cityArray[i!].title
        
        CLGeocoder().geocodeAddressString(addressString!, completionHandler:
        {(placemarks, error) in
                
            if error != nil {
                print("Geocode failed: \(error!.localizedDescription)")
            } else if placemarks!.count > 0 {
                let placemark = placemarks![0]
                let location = placemark.location
                let coords = location!.coordinate
                self.lon = coords.longitude
                self.lat = coords.latitude
                print(location!)
                
                let span = MKCoordinateSpanMake(0.05, 0.05)
                let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                self.map.setRegion(region, animated: true)
                let ani = MKPointAnnotation()
                ani.coordinate = placemark.location!.coordinate
                ani.title = placemark.locality
                ani.subtitle = placemark.subLocality
                
                self.map.addAnnotation(ani)
            }
        })

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMap(_ sender: Any) {
        //print("Inside Show Map Function");
        
        switch(mapType.selectedSegmentIndex)
        {
            case 0:
                map.mapType = MKMapType.standard
            
            case 1:
                map.mapType = MKMapType.satellite
            
            default:
                map.mapType = MKMapType.standard
        }
        
        // display the map
        
        if lon == 0 || lat == 0 {
            self.lon = -112.06
            self.lat = 33.45
        }

        let coordinates = CLLocationCoordinate2D( latitude: lat, longitude: lon)
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)

        let region: MKCoordinateRegion = MKCoordinateRegionMake(coordinates, span)

        self.map.setRegion(region, animated: true)

        // add an annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = titleView.text

        self.map.addAnnotation(annotation)
        
    }
}
