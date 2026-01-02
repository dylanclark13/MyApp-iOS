import SwiftUI
import SwiftData

struct VendorListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Vendor.name) private var vendors: [Vendor]

    let selectedCategories: Set<String>

    private var filtered: [Vendor] {
        guard selectedCategories.isEmpty == false else { return vendors }
        return vendors.filter {
            $0.categories.contains(where: selectedCategories.contains)
        }
    }

    var body: some View {
        List {
            ForEach(filtered) { vendor in
                NavigationLink {
                    VendorDetailView(vendor: vendor)
                } label: {
                    VStack(alignment: .leading) {
                        Text(vendor.name)
                        Text(vendor.address)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .onDelete { offsets in
                for index in offsets {
                    modelContext.delete(filtered[index])
                }
            }
        }
    }
}
