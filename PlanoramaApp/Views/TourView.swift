//
//  TourView.swift
//  Planorama
//
//  Created by Sergio Acosta on 5/10/22.
//

import SwiftUI

struct TourView: View {
    @ObservedObject var locations = ApiCall()

    var location: String
    var body: some View {
        VStack {
            ScrollView {
               
                ForEach(locations.results) { location in
                    
                    FeaturedCard(name: location.name!, rating: location.rating!,long: location.coordinates?.longitude ?? 0.0, lat: location.coordinates?.latitude ?? 0.0, image_url: location.image_url!, city: location.location?.city! ?? "city", phone: location.display_phone!)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        
                
                }
                .padding()
            }.onAppear{
                locations.loadData(categories: "tours", term: "", loc: location)
            }
        }
    }
}

struct TourView_Previews: PreviewProvider {
    static var previews: some View {
        TourView(location: "rome")
    }
}
