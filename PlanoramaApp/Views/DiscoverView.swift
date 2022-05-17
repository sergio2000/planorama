//
//  DiscoverView.swift
//  Itinerary App
//
//  Created by Sergio Acosta on 4/21/22.
//

import SwiftUI

struct DiscoverView: View {
@State var searchText: String = ""

@ObservedObject var fetch = ApiCall()
    var body: some View {

        
        ScrollView {
            ForEach(fetch.results, id: \.name) { location in
                                
                                    FeaturedCard(name: location.name!, rating: location.rating!,long: location.coordinates?.longitude ?? 0.0, lat: location.coordinates?.latitude ?? 0.0, image_url: location.image_url!, city: location.location?.city! ?? "city", phone: location.display_phone!)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(10)
                }.padding()
                                .searchable(text: $searchText)
                                .onChange(of: searchText) { value in
                                        async {
                                        if !value.isEmpty &&  value.count > 3 {
                                            fetch.loadData(categories: "", term: searchText, loc: "sanmarcosca")
                                        } else {
                                            fetch.results.removeAll()
                                        }
                                    }
                            }
        }
        }
 
}



struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

   
