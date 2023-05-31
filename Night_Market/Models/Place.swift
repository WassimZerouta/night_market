//
//  Place.swift
//  Night_Market
//
//  Created by Wass on 31/05/2023.
//

import Foundation
import CoreLocation

struct Place: Identifiable {
    var id = UUID()
    var name: String
    var address: String
    var image: String
    var type: PlaceType
    var coordinate: CLLocationCoordinate2D
    
    
    enum PlaceType {
        case restaurant
        case bar
        case grossery
    }
    
    init(name: String, address: String, image: String, type: PlaceType, coordinate: CLLocationCoordinate2D) {
         self.name = name
         self.address = address
         self.image = image
         self.type = type
         self.coordinate = coordinate
     }
}
