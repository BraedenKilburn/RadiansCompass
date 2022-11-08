//
//  CompassHeading.swift
//  RadiansCompass
//
//  Created by Braeden Kilburn on 11/7/22.
//

import Combine
import CoreLocation
import Foundation

class CompassHeading: NSObject, ObservableObject, CLLocationManagerDelegate {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var radians: Double = .zero {
        didSet {
            objectWillChange.send()
        }
    }

    private let locationManager: CLLocationManager

    override init() {
        locationManager = CLLocationManager()
        super.init()

        locationManager.delegate = self
        setup()
    }

    private func setup() {
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.headingAvailable() {
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
    }

    func locationManager(_: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        radians = -deg2rad(newHeading.magneticHeading)
    }
    
    func deg2rad(_ number: Double) -> Double {
        return number * .pi / 180
    }
}
