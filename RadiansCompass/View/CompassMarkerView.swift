//
//  CompassMarkerView.swift
//  RadiansCompass
//
//  Created by Braeden Kilburn on 11/7/22.
//

import SwiftUI

struct CompassMarkerView: View {
    let marker: Marker
    let compassRadians: Double

    var body: some View {
        VStack {
            Text("\(marker.text)")
                .fontWeight(.medium)
                .rotationEffect(self.textAngle())

            Capsule()
                .frame(width: self.capsuleWidth(),
                       height: self.capsuleHeight())
                .foregroundColor(self.capsuleColor())

            Text(marker.label)
                .fontWeight(.bold)
                .rotationEffect(self.textAngle())
            
            Spacer(minLength: 120)
        }
        .rotationEffect(Angle(radians: marker.radians))
    }

    private func capsuleWidth() -> CGFloat {
        return marker.radians == 0 ? 7 : 3
    }

    private func capsuleHeight() -> CGFloat {
        return marker.radians == 0 ? 45 : 30
    }

    private func capsuleColor() -> Color {
        return marker.radians == 0 ? .red : .gray
    }

    private func textAngle() -> Angle {
        return Angle(radians: -compassRadians - marker.radians)
    }
}

struct CompassMarkerView_Previews: PreviewProvider {
    static var previews: some View {
        let marker = Marker.markers()[1]

        CompassMarkerView(marker: marker, compassRadians: marker.radians)
    }
}
