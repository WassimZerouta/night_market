//
//  PlaceViewModel.swift
//  Night_Market
//
//  Created by Wass on 31/05/2023.
//

import Foundation
import SwiftUI
import CoreLocation

class PlaceViewModel: ObservableObject {
    @Published var places: [Place] = []
    
    init() {
        setupPlaces()
    }
    
    func setupPlaces() {
        let place1 = Place(name: "Le Petit Marché By NIGHT CORNER", address: "2 Rue Chomel, 75007 Paris", image: "https://lh3.googleusercontent.com/p/AF1QipP-QD1-HOzxhxih1ANYR4SgNIAjfYE021bL3o1A=s1360-w1360-h1020", type: .grossery, coordinate: CLLocationCoordinate2D(latitude: 2.3264178699168068, longitude: 48.85229205044354) )
        
        let place2 = Place(name: "LE PANIER D'ALESIA", address: "66 Av. du Général Leclerc, 75014 Paris", image: "https://lh3.googleusercontent.com/p/AF1QipMVlN1jp2RoLbkIFJN4Mxy2pDMzoIAWHwwr60Ae=s1360-w1360-h1020", type: .grossery, coordinate: CLLocationCoordinate2D(latitude: 2.3281851079265707, longitude: 48.82968092386353)  )
        
        places.append(place1)
        places.append(place2)
    }
}
