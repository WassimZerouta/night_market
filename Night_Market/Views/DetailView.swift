//
//  DetailView.swift
//  Night_Market
//
//  Created by Wass on 01/06/2023.
//

import SwiftUI

struct DetailView: View {
    var place: Place
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: place.image)) { image in
                if let image = image {
                    image
                        .resizable()
                        .frame(height: 200)
                } else {
                    Text("Échec du chargement de l'image")
                        .foregroundColor(.red)
                }
            } placeholder: {
                Image("Spoon_cLe_Bonbon-1-2598x1996")
                    .resizable()
                    .frame(height: 200)
            }
        }
        Text(place.name)
        Text(place.address)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("aa")
    }
}
