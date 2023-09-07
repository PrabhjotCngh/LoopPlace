//
//  LocationModel.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-28.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    
    // Computer Property
    var mapCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
