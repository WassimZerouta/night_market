//
//  ContentView.swift
//  Night_Market
//
//  Created by Wass on 29/05/2023.
//

import SwiftUI
import Combine
import MapKit

struct ContentView: View {
    
    @StateObject var deviceLocationServices = DeviceLocationService.shared
    @State var tokens: Set<AnyCancellable> = []
    @State var coordinates: (lat: Double, lon: Double) = (0.5,0.5)

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ZStack {
                        MapView(region: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordinates.lat, longitude: coordinates.lon), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))))
                            .frame(width: geometry.size.width, height: geometry.size.height / 2.5)
                            .offset(y: -geometry.size.height / 5)
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .frame(width: geometry.size.width, height: geometry.size.height * 2.2/3)
                            .offset(y: geometry.size.height / 3)
                    }
                }
            }
        }
                .ignoresSafeArea()
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
