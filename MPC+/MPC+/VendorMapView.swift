import SwiftUI
import MapKit

struct VendorMapView: View {

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
        span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
    )

    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}
