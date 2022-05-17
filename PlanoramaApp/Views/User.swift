//
//  User.swift
//  Planorama
//
//  Created by Sergio Acosta on 5/4/22.
//

import Foundation

struct User: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var surname: String
}
