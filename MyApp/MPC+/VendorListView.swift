import SwiftUI
import SwiftData
struct VendorListView: View {
@Environment(\.modelContext) private var modelContext
@Query(sort: [SortDescriptor(\Vendor.name, order: .forward)]) private var vendors: [Vendor]
@State private var searchText = ""

private var filtered: [Vendor] {
    let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
    if trimmed.isEmpty { return vendors }
    let q = trimmed.lowercased()
    return vendors.filter { vendor in
        vendor.name.lowercased().contains(q) || vendor.address.lowercased().contains(q)
    }
}

var body: some View {
    List {
        ForEach(filtered) { vendor in
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
        .onDelete(perform: delete)
    }
    .navigationTitle("Vendors")
    .searchable(text: $searchText)
    .toolbar {
        EditButton()
    }
}

private func delete(at offsets: IndexSet) {
    for index in offsets {
        modelContext.delete(filtered[index])
    }
}
}
