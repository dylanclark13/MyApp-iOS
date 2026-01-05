import SwiftUI

struct VendorListView: View {

    let vendors: [Vendor]

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
