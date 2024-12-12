//
//  Location.swift
//  BucketList
//
//  Created by Mark Santoro on 12/12/24.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude) }

    static let example = Location(id: UUID(), name: "Sphere", description: "Big light", latitude: 36.121246, longitude: -115.162060)
    static func ==(lhs: Location, rhs: Location) -> Bool {
        (lhs.id == rhs.id)
    }
    
    let id: UUID
    var name: String
    var description:String
    var latitude: Double
    var longitude: Double
}

