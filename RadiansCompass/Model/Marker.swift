//
//  Marker.swift
//  RadiansCompass
//
//  Created by Braeden Kilburn on 11/7/22.
//

import Foundation

struct Marker: Hashable {
    let radians: Double
    let text: String
    let label: String

    init(radians: Double, text: String = "", label: String = "") {
        self.radians = radians
        self.text = text
        self.label = label
    }

    static func markers() -> [Marker] {
        return [
            Marker(radians: 0, text: "0", label: "N"),
            Marker(radians: .pi / 6, text: "π / 6"),
            Marker(radians: .pi / 3, text: "π / 3"),
            Marker(radians: .pi / 2, text: "π / 2", label: "E"),
            Marker(radians: 2 * .pi / 3, text: "2π / 3"),
            Marker(radians: 5 * .pi / 6, text: "5π / 6"),
            Marker(radians: .pi, text: "π", label: "S"),
            Marker(radians: 7 * .pi / 6, text: "7π / 6"),
            Marker(radians: 4 * .pi / 3, text: "4π / 3"),
            Marker(radians: 3 * .pi / 2, text: "3π / 2", label: "W"),
            Marker(radians: 5 * .pi / 3, text: "5π / 3"),
            Marker(radians: 11 * .pi / 6, text: "11π / 6"),
        ]
    }
}
