//
//  FeaturedCard.swift
//  Planorama
//
//  Created by Sergio Acosta on 5/7/22.
//

import SwiftUI

struct FeaturedCard: View {
    @EnvironmentObject var viewModel: AppViewModel

    var name = ""
    var rating = 0.0
    var long: Double
    var lat: Double
    var image_url: String
    var city: String
    var phone: String

    var body: some View {

        VStack {

            
            HStack {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: image_url)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            
                    } placeholder: {
                        Color.purple.opacity(0.1)
                    }
                    .frame(width: 300, height: 300)
                    .cornerRadius(10)
                    
                    
                    HStack(alignment:.center) {
                        VStack(alignment:.leading) {
                    Text(name.prefix(25))
                        .font(.headline)
                        .foregroundColor(.secondary)
                    switch rating {
                    case 0.0:
                        Image("regular_0")
                    case 1.0:
                        Image("regular_1")
                    case 1.5:
                        Image("regular_1_half")
                    case 2.0:
                        Image("regular_2")
                    case 2.5:
                        Image("regular_2_half")
                    case 3.0:
                        Image("regular_3")
                    case 3.5:
                        Image("regular_3_half")
                    case 4.0:
                        Image("regular_4")
                    case 4.5:
                        Image("regular_4_half")
                    case 5.0:
                        Image("regular_5")
                    default:
                        Image("regular_0")

                    }
                    
                    Text(city.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                   
                    }
                        Spacer()
//                        Button("ADD") {
//                            viewModel.addData(name: name, notes: "Bring jetski", time: "8:00", rating: rating, longitude: 3.0, latitude: 4.0, image: image_url)
//                        }
                        NavigationLink(destination: AddView(value: "", phone: phone, city: city, name: name,rating: rating, long: long, lat: lat, image: image_url)) {
                           
                            Text("ADD")
                        }
                        .foregroundColor(Color.white)
                        .frame(width: 70, height: 30)
                        .background(Color.cyan)
                        .cornerRadius(50)
                        
                    }

                    
                }
                .layoutPriority(100)

                Spacer()
       
            }
            .padding()

            .listRowBackground(Color.green)
        }
        
    }
}

struct FeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCard(name: "Chick-fil-a", rating: 4.5,long: 4.5,lat: 4.6, image_url: "https://static.cfacdn.com/photos/restaurants/01959/large.jpg", city: "san", phone:"760")
    }
}
