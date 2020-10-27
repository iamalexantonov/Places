//
//  ViewModel.swift
//  Places
//
//  Created by Alexey Antonov on 26/10/2020.
//

import Foundation
import CoreLocation
import Combine

class ViewModel: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    @Published private(set) var locations = [Location]()
    
    override init() {
        super.init()
        
        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
}

extension ViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        
        self.locations.removeAll()
        places.sort { currentLocation.distance(from: $0.location) < currentLocation.distance(from: $1.location) }
        places.forEach { self.locations.append(Location(title: $0.title, distance: currentLocation.distance(from: $0.location) / 1000))}
    }
}
