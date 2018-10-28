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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView.text = citys?.cityArray[i!].title
        descView.text = citys?.cityArray[i!].description
        imageView.image = citys?.cityArray[i!].image
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMap(_ sender: Any) {
        
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
        let lon : CLLocationDegrees = -112.06
        
        let lat : CLLocationDegrees = 33.45
        
        let coordinates = CLLocationCoordinate2D( latitude: lat, longitude: lon)
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(coordinates, span)
        
        self.map.setRegion(region, animated: true)
        
        // add an annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinates
        annotation.title = "Phoenix"
        annotation.subtitle = "AZ"
        
        self.map.addAnnotation(annotation)
        
    }
}
