//
//  HomeView.swift
//  Itinerary App
//
//  Created by Sergio Acosta on 4/21/22.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct HomeView: View {
@StateObject var locations = ApiCall()

    @EnvironmentObject var viewModel: AppViewModel
@State var location = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Hello \(viewModel.first)!")
            .font(.title)
            
          
                            .frame(height: 44)
                            .padding()
                TextField("Where to?", text: $location)
                    .padding()
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .background(Color(.secondarySystemBackground))
                HStack {
                    
                    NavigationLink(destination: HotelView(location: location)) {
                        Image(systemName: "building.2.crop.circle.fill")
                        Text("Hotels")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 175, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    NavigationLink(destination: RestaurantView(location: location)) {
                        Image(systemName: "fork.knife.circle.fill")
                        Text("Restaurants")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 175, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                }
                .padding(.top, 15)
                HStack {
                    
                    NavigationLink(destination: TourView(location: location)) {
                        Image(systemName: "bus")
                        Text("Tours")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 175, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                    NavigationLink(destination: EntertainmentView(location: location)) {
                        Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                        Text("Entertainment")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 175, height: 50)
                    .background(Color.black)
                    .cornerRadius(10)
                }
                Text("Popular")
                    .font(.largeTitle)
                HStack {
                    ScrollView(.horizontal){
                        HStack {
                        ForEach(locations.results) { location in
                            
                            FeaturedCard(name: location.name!, rating: location.rating!,long: location.coordinates?.longitude ?? 0.0, lat: location.coordinates?.latitude ?? 0.0, image_url: location.image_url!, city: location.location?.city! ?? "city", phone: location.display_phone!)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                
                        }
                        }
                    }.onChange (of: location){ location in
                        
                        locations.loadData(categories: "localflavor", term:"", loc:location)
                    }
                }
            }
            .onAppear(perform:viewModel.fetchUser)
            .padding()

        }.navigationTitle("Planorama")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
