//
//  ContentView.swift
//  Itinerary App
//
//  Created by Sergio Acosta on 4/21/22.
//

import SwiftUI

struct TabView2: View {
        @State var selection = 1
var body: some View {

        TabView(selection: $selection) {
        
            NavigationView {
                HomeView()
                    .navigationTitle("Home")
            }
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }.tag(1)
            NavigationView {
                DiscoverView()
                    .navigationTitle("Discover")
            }
                    .tabItem {
                        Label("Discover", systemImage: "magnifyingglass")
                    }.tag(2)
            NavigationView {
                ItineraryView()
                    .navigationTitle("Itinerary")
            }
                    .tabItem {
                        Label("Itinerary", systemImage: "globe.americas.fill")
                    }.tag(3)
            NavigationView {
                ProfileView()
                    .navigationTitle("Profile")
            }
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }.tag(4)
      
        }
        

}
}


struct TabView2_Previews: PreviewProvider {
    static var previews: some View {
        TabView2()
    }
}
