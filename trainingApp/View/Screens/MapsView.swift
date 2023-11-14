import SwiftUI
import MapKit

struct MapsView: View {
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    @State private var searchText = ""
    @State private var results = [MKMapItem]()
    
    var body: some View {
        Map(position: $cameraPosition) {
            Marker("my coordinate", systemImage: "paperplane" ,coordinate: .userLocation)
                .tint(.cyan)
      
        ForEach(results, id: \.self) { item in
            let placemark = item.placemark
            Marker(placemark.name ?? "", coordinate: placemark.coordinate)
            }
        }
        .overlay(alignment: .top) {
            TextField("Search gym", text: $searchText)
                .font(.subheadline).padding(12)
                .background(.white)
                .padding()
                .shadow(radius: 12)
        }

        .onSubmit(of: .text) {
            Task { await search() }
        }
        .mapControls {
            MapCompass()
            MapPitchToggle()
            MapUserLocationButton()
        }
    }
}

extension MapsView {
    func search() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = .userRegion // Fix the typo here
        
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 59.33238615143806, longitude: 18.064544482829312)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion { // Fix the typo here
        return .init(center: .userLocation, latitudinalMeters: 500, longitudinalMeters: 500)
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}


#Preview {
    MapsView()
}

// option + mouse. 2D/3D
//. Gym
