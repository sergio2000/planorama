//
//  AddView.swift
//  Planorama
//  View appears after user presses add button for certain event.
//  Created by Sergio Acosta on 5/10/22.
//

import SwiftUI

struct AddView: View {

    @EnvironmentObject var viewModel: AppViewModel
    @State var eventDate = Date()
    @State var value: String
    var phone: String
    var city: String
    var name: String
    var rating: Double
    var long: Double
    var lat: Double
    var image: String
    
    @State var notes = ""
    
    @State var event = false
    var body: some View {
        VStack {
       CircleImage(image_url: image)
                .shadow(radius: 5)
            Text(name)
                .font(.largeTitle)
                .padding(20)
            
            TextField("Notes", text: $notes)
                .padding()
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .background(Color(.secondarySystemBackground))
            
            DatePicker(selection: $eventDate, label: { Text("Date") })
                    .padding(15)
          
            
                                Button("ADD") {

                                    viewModel.addData(name: name,notes: notes, phone: phone, city: city, date: eventDate, rating: rating, longitude: long, latitude: lat, image: image)
                                  
                                    event = true
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                                            self.event = false
                                                        }
                                    }
                                .foregroundColor(Color.white)
                                .frame(width: 175, height: 50)
                                .background(Color.red)
                                .cornerRadius(10)
                                .padding(25)
    
            if event {
                Text("Event Added to Itinerary")
            }
            Spacer()
        }
        
        .padding()
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(value: "", phone: "760", city: "san marcos", name: "Disneyland", rating: 4.5, long: 3.0, lat: 3.0, image: "https://cdn.vox-cdn.com/thumbor/SpSkgenVAWLpZvBsPqMWwkTtsuk=/0x0:3100x2214/1200x900/filters:focal(1404x942:1900x1438)/cdn.vox-cdn.com/uploads/chorus_image/image/59218317/1233313312.14.jpg")
    }
}
