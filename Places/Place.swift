//
//  Place.swift
//  Places
//
//  Created by Alexey Antonov on 26/10/2020.
//

import Foundation
import CoreLocation

struct Place {
    var title: String
    var location: CLLocation
}

struct Location: Identifiable {
    var id = UUID()
    var title: String
    var distance: Double?
}

var places = [
    Place(title: "Gambrinus", location: CLLocation(latitude: 40.8367669, longitude: 14.2484674)),
    Place(title: "100 Montaditos", location: CLLocation(latitude: 40.84285, longitude: 14.2268812)),
    Place(title: "Pizzeria Francesco Rocco", location: CLLocation(latitude: 40.8831116, longitude: 14.3105305)),
    Place(title: "Officina Vegana", location: CLLocation(latitude: 40.8451513, longitude: 14.2545313)),
    Place(title: "Pizzeria Cibus", location: CLLocation(latitude: 40.8365186, longitude: 14.3021643))
]
