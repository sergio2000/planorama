//
//  PlaceDetails.swift
//  Planorama
//
//  Created by Sergio Acosta on 5/8/22.
//

import SwiftUI
import MapKit

struct PlaceDetails: View {
    
    var name: String
    var notes: String
    var city: String
    var phone_number: String
    var image:String
    var rating: Double
    var lat: Double
    var long: Double
    
        var body: some View {
            ScrollView {
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))), interactionModes: [])
                    
                    .frame(height: 300)
                
                CircleImage(image_url: image)
                                .offset(y: -130)
                                .padding(.bottom, -130)
                                .shadow(radius: 5)
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title)
                    
                    HStack {
                        Text(city)
                            
                        Spacer()
                        Text(phone_number)
                            
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("Notes")
                        .font(.title2)
                    Text(notes)
                        .font(.title3)
//                    Text(rating)
                }
                .padding()
                
            }.navigationTitle("Details")
        }
    }

    


struct PlaceDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetails(name: "Chick Fil A", notes: "hey", city: "San Marcos", phone_number: "(415) 749-2060", image: "https://m.media-amazon.com/images/M/MV5BNWM0ZGJlMzMtZmYwMi00NzI3LTgzMzMtNjMzNjliNDRmZmFlXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_UY1200_CR90,0,630,1200_AL_.jpg", rating: 4.5, lat: 51.507222, long: -0.1275)
    }
}
