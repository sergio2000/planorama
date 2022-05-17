//
//  ItineraryView.swift
//  Itinerary App
//
//  Created by Sergio Acosta on 4/21/22.
//

import SwiftUI
import CoreLocation
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct ItineraryView: View {
    private var db = Firestore.firestore()

    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()

    
    @ObservedObject var fetch = ApiCall()
    @ObservedObject private var viewModel = AppViewModel()

//    var groupedByDate: [Date: [Event]] {
//        Dictionary(grouping: viewModel.events, by: {$0.time})
//    }
//
//    var headers: [Date] {
//        groupedByDate.map({ $0.key }).sorted()
//    }

    var body: some View {
//        List {
//                    ForEach(headers, id: \.self) { header in
//                        Section(header: Text(header, style: .date)) {
//                            ForEach(groupedByDate[header]!) { scan in
//                                Text(scan.name!)
//                            }
//                        }
//                    }
//                }

                List{

                    ForEach(viewModel.events) { event in
                        Section(header: Text(event.name!)) {
                            NavigationLink(destination: PlaceDetails(name: event.name!, notes: event.notes!, city: event.city!, phone_number: event.phone!, image: event.image!, rating: event.rating!, lat: event.latitude!, long: event.longitude!))
                        {

                            ItineraryCard(image_url: event.image!, name: event.name!, rating: event.rating!)
                            }
                        
                        }

                    }.onDelete(perform: delete)
                }.onAppear(perform: viewModel.fetchData)
            








        
        
            
    }

        
    func delete(at offsets: IndexSet) {
    guard let userID = Auth.auth().currentUser?.uid else { return }

    offsets.map { viewModel.events[$0]}.forEach { todo in
      guard let todoID = todo.id else { return }
        db.collection(userID).document(todoID).delete() { err in
      if let err = err {
        print("Error removing document: \(err)")
      } else {
        print("Document successfully removed!")
      }
    }
  }
}
    
    
    
    
    
    
}
struct ItineraryView_Previews: PreviewProvider {
    static var previews: some View {
        
            ItineraryView()
        
    }
}

    
    



