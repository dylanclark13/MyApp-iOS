import SwiftUI
import MapKit

struct VendorMapView: View {

    let vendors: [Vendor]

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )

    @State private var selectedVendor: Vendor?

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: vendors) { vendor in
            MapAnnotation(coordinate: vendor.coordinate) {
                Button {
                    selectedVendor = vendor
                } label: {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
        }
        .sheet(item: $selectedVendor) { vendor in
            NavigationStack {
                VendorDetailView(vendor: vendor)
            }
        }
        .ignoresSafeArea()
    }
}
