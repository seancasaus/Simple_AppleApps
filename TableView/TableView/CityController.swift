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
    @IBOutlet weak var searchField: UITextField!
    
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
        //showMap(self)
        
        CLGeocoder().geocodeAddressString(addressString!, completionHandler:
        {(placemarks, error) in
                
            if error != nil {
                print("Geocode failed: \(error!.localizedDescription)")
            } else {
                let placemark = placemarks![0]
                let location = placemark.location
                let coords = location!.coordinate
                self.lon = coords.longitude
                self.lat = coords.latitude
                self.showMap(self)
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
    
    @IBAction func search(_ sender: UIButton) {
        if(!searchField.text!.isEmpty) {
            let request = MKLocalSearchRequest()
            request.naturalLanguageQuery = searchField.text
            request.region = map.region
            let search = MKLocalSearch(request: request)
            
            search.start { response, _ in
                guard let response = response else {
                    return
                }
                print( response.mapItems )
                var matchingItems:[MKMapItem] = []
                matchingItems = response.mapItems
                for i in 1...matchingItems.count - 1 {
                    let place = matchingItems[i].placemark
                    let marker = MKPointAnnotation()
                    marker.coordinate = (place.location?.coordinate)!
                    marker.title = place.name
                    self.map.addAnnotation(marker)
                }
            }
        }
    }
}
