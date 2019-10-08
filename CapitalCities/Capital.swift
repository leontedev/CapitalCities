//
//  Capital.swift
//  CapitalCities
//
//  Created by Mihai Leonte on 10/4/19.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var url: URL
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String, url: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.url = URL(string: url)!
    }
}
