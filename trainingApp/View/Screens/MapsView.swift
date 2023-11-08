//
//  MapsView.swift
//  trainingApp
//
//  Created by Andreas Antonsson on 2023-11-08.
//

import SwiftUI
import MapKit

struct MapsView: View {
    
    // 59.33238615143806, 18.064544482829312
    @State private var cameraPosition: MapCameraPosition = .region(.userReigion)
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Map(position: $cameraPosition)
                
                VStack() {
             
                    Text("Find your training center!")
                        .foregroundColor(.cyan)
                        .padding()
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.15)
                .background(Color.black)
                .cornerRadius(9)
                .shadow(radius: 10)
                .offset(y: -geometry.size.height * 0.4)
            }
        }
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 59.33238615143806, longitude: 18.064544482829312)
    }
}

extension MKCoordinateRegion {
    static var userReigion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 500, longitudinalMeters: 500)
    }
}

#Preview {
    MapsView()
}
