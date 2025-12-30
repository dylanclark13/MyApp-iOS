import SwiftUI
import MapKit
struct ContentView: View {
@State private var selectedVendor: Vendor?
private let nycRegion = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
    span: MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
)

private var vendors: [Vendor] {
    [
        Vendor(name: "Manhattan Plumbing Supply", category: "Plumbing Supply", address: "Manhattan, NY", phone: "2125550101", website: "https://example.com", notes: nil, latitude: 40.7440, longitude: -73.9950),
        Vendor(name: "Brooklyn Pipe and Valve", category: "Plumbing Supply", address: "Brooklyn, NY", phone: "7185550102", website: "https://example.com", notes: nil, latitude: 40.6782, longitude: -73.9442),
        Vendor(name: "Queens Supply Co", category: "Plumbing Supply", address: "Queens, NY", phone: "3475550103", website: "https://example.com", notes: nil, latitude: 40.7282, longitude: -73.7949),
        Vendor(name: "Bronx Plumbing Warehouse", category: "Plumbing Supply", address: "Bronx, NY", phone: "9175550104", website: "https://example.com", notes: nil, latitude: 40.8448, longitude: -73.8648),
        Vendor(name: "Staten Island Supply", category: "Plumbing Supply", address: "Staten Island, NY", phone: "9295550105", website: "https://example.com", notes: nil, latitude: 40.5795, longitude: -74.1502),
        Vendor(name: "Harlem Plumbing Mart", category: "Plumbing Supply", address: "Harlem, NY", phone: "6465550106", website: "https://example.com", notes: nil, latitude: 40.8116, longitude: -73.9465),
        Vendor(name: "Astoria Plumbing Supply", category: "Plumbing Supply", address: "Astoria, NY", phone: "7185550107", website: "https://example.com", notes: nil, latitude: 40.7644, longitude: -73.9235),
        Vendor(name: "Downtown Plumbing Depot", category: "Plumbing Supply", address: "Lower Manhattan, NY", phone: "2125550108", website: "https://example.com", notes: nil, latitude: 40.7081, longitude: -74.0086),
    ]
}

var body: some View {
    NavigationStack {
        Map(initialPosition: .region(nycRegion), selection: $selectedVendor) {
            ForEach(vendors) { vendor in
                Annotation(vendor.name, coordinate: CLLocationCoordinate2D(latitude: vendor.latitude, longitude: vendor.longitude)) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.title2)
                }
                .tag(vendor)
            }
        }
        .navigationTitle("MPC+")
        .sheet(item: $selectedVendor) { vendor in
            VendorDetailView(vendor: vendor)
        }
    }
}
}
struct VendorDetailView: View {
let vendor: Vendor
var body: some View {
    NavigationStack {
        List {
            Section("Company") {
                Text(vendor.name)
                Text(vendor.category)
            }
            Section("Location") {
                Text(vendor.address)
                Text("\(vendor.latitude), \(vendor.longitude)")
            }
            Section("Contact") {
                Text(vendor.phone)
                Text(vendor.website)
            }
        }
        .navigationTitle("Details")
    }
}
}
#Preview {
ContentView()
}
