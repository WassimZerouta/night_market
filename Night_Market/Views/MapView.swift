//
//  MapView.swift
//  Night_Market
//
//  Created by Wass on 01/06/2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    
    @Binding var region: MKCoordinateRegion
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
       Text("")
    }
}
