//
//  Element.swift
//  Elements
//
//  Created by Tsering Lama on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct AllElements: Codable {
    let name: String
    let atomicMass: Double?
    let symbol: String
    var number: Int
    let melt: Double?
    let boil: Double?
    let discoveredBy: String?
    let favoritedBy: String?
    
    enum CodingKeys: String, CodingKey {

        case name
        case atomicMass = "atomic_mass"
        case symbol
        case number
        case melt
        case boil
        case discoveredBy = "discovered_by"
        case favoritedBy
    }
}
