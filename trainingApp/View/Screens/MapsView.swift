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
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.33238615143806, longitude: 18.064544482829312), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Map(coordinateRegion: $region).ignoresSafeArea()
                
                VStack(alignment: .leading) {
             
                    Text("Find your training center!")
                        .foregroundColor(.black)
                        .padding()
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.05)
                .background(Color.white)
                .cornerRadius(9)
                .shadow(radius: 10)
                .padding()
                
            }
        }
    

    }
}

#Preview {
    MapsView()
}
