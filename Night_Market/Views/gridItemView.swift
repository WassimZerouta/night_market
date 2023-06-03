//
//  gridItemView.swift
//  Night_Market
//
//  Created by Wass on 01/06/2023.
//

import SwiftUI

struct gridItemView: View {
    
    var place: Place
    
    var body: some View {
            HStack {
                AsyncImage(url: URL(string: place.image)) { image in
                    if let image = image {
                        image
                            .resizable()
                            .frame(width: 120)
                    } else {
                        Text("Échec du chargement de l'image")
                            .foregroundColor(.red)
                    }
                } placeholder: {
                    Image("Spoon_cLe_Bonbon-1-2598x1996")
                        .resizable()
                        .frame(width: 120)
                    
                }
                
                Spacer()
                VStack {
                    Text(place.name)
                        .bold()
                    Text("Épicerie de nuit")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .background()
            .frame(width: UIScreen.main.bounds.width-40, height: 150)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 2)

    }
}

struct gridItemView_Previews: PreviewProvider {
    static var previews: some View {
        Text("ok")
    }
}
