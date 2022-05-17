//
//  Event.swift
//  Planorama
//
//  Created by Sergio Acosta on 5/9/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Event: Codable, Identifiable, Hashable {
    @DocumentID var id: String? = UUID().uuidString
    var name: String?
    var phone: String?
    var city: String?
    var notes: String?
    var rating: Double?
    var date: Date?
    var longitude: Double?
    var latitude: Double?
    var image: String?
    
}
