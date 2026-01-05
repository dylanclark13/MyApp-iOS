import SwiftUI

struct ContentView: View {

    let vendors = Vendor.sampleData

    var body: some View {
        VendorMapView(vendors: vendors)
    }
}
