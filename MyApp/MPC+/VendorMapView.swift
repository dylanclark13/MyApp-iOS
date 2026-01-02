import SwiftUI
import MapKit
import SwiftData

struct VendorMapView: View {
    @Query private var vendors: [Vendor]
    let selectedCategories: Set<String>

    private var filteredVendors: [Vendor] {
        guard selectedCategories.isEmpty == false else { return vendors }
        return vendors.filter {
            $0.categories.contains(where: selectedCategories.contains)
        }
    }

    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
            span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        )
    )

    @State private var selectedVendor: Vendor?

    var body: some View {
        Map(position: $cameraPosition, selection: $selectedVendor) {
            ForEach(filteredVendors) { vendor in
                Annotation(
                    vendor.name,
                    coordinate: CLLocationCoordinate2D(
                        latitude: vendor.latitude,
                        longitude: vendor.longitude
                    )
                ) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title)
                        .foregroundStyle(.red)
                }
                .tag(vendor)
            }
        }
        .sheet(item: $selectedVendor) { vendor in
            VendorDetailView(vendor: vendor)
        }
    }
}
