import SwiftUI

struct VendorListView: View {

    // Temporary in memory source.
    // This will later be replaced with persistence safely.
    let vendors: [Vendor] = Vendor.sampleData

    var body: some View {
        List(vendors) { vendor in
            NavigationLink {
                VendorDetailView(vendor: vendor)
            } label: {
                VStack(alignment: .leading, spacing: 4) {
                    Text(vendor.name)
                        .font(.headline)

                    Text(vendor.address)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("Vendors")
    }
}
