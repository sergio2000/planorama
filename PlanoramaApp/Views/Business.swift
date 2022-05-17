//
//  Business.swift
//  Planorama
//  
//  Created by Sergio Acosta on 5/7/22.
//

import Foundation
import CoreLocation

struct SearchResult: Codable{
    let businesses: [Business]
}
struct Business: Codable, Identifiable {
    let rating: Double?
    let price, phone, id, alias: String?
    let is_closed: Bool?
    let review_count: Double?
    let name: String?
    let url: String?
    let image_url: String?
    let distance: Double?
    let transactions: [String]?
    let coordinates: Coordinates?
    let display_phone: String?
    let location: Location?
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    struct Location: Hashable, Codable {
        var city: String?
    }
}

//struct Review: Codable, Identifiable {
//    
//}
