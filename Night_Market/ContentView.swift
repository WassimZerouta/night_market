//
//  ContentView.swift
//  Night_Market
//
//  Created by Wass on 29/05/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var deviceLocationServices = DeviceLocationService.shared
    
    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0,0)

    var body: some View {
        VStack {
            Text("lat: \(coordinates.lat)")
            Text("lon: \(coordinates.lon)")
        }
        .onAppear{
            observeCoordinatorUpdates()
            observedLocationAccessDenied()
            deviceLocationServices.requestLocationUpdates()
        }
    }
        
    
    
    func observeCoordinatorUpdates() {
            deviceLocationServices.coordinatesPublisher
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    if case .failure(let error) = completion { print(error) }
                    
                } receiveValue: { coordinates in
                    self.coordinates = (coordinates.latitude, coordinates.longitude)
                }
                .store(in: &tokens)
        }
    
    func observedLocationAccessDenied() {
        deviceLocationServices.deniedLocationAccessPublisher
            .receive(on: DispatchQueue.main)
            .sink { print("Position refusé")
            }
            .store(in: &tokens)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
        }
}
