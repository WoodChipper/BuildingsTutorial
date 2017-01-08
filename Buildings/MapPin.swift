//
//  MapPin.swift
//  Buildings
//
//  Created by Don Gordon on 1/5/17.
//  Copyright © 2017 DGsolutions. All rights reserved.
//

import MapKit
//import CoreLocation

class MapPin: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
