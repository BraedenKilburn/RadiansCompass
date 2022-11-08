//
//  ContentView.swift
//  RadiansCompass
//
//  Created by Braeden Kilburn on 11/7/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var compassHeading = CompassHeading()

    var body: some View {
        VStack {
            Capsule()
                .frame(width: 5,
                       height: 50)
            ZStack {
                ForEach(Marker.markers(), id: \.self) { marker in
                    CompassMarkerView(marker: marker,
                                      compassRadians: self.compassHeading.radians)
                }
            }
            .frame(width: 300,
                   height: 300)
            .rotationEffect(Angle(radians: self.compassHeading.radians))
            .statusBar(hidden: true)
            
            Text("\(String(format: "%.3f", -self.compassHeading.radians))")
                .font(.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
