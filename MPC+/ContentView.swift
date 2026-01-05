import SwiftUI

struct ContentView: View {

    enum ViewMode {
        case map
        case list
    }

    @State private var viewMode: ViewMode = .map

    // ContentView owns the vendors
    private let vendors: [Vendor] = Vendor.sampleData

    var body: some View {
        NavigationStack {
            ZStack {
                switch viewMode {
                case .map:
                    VendorMapView(vendors: vendors)

                case .list:
                    VendorListView(vendors: vendors)
                }
            }
            .navigationTitle("MPC+")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        toggleView()
                    } label: {
                        Image(systemName: viewMode == .map ? "list.bullet" : "map")
                    }
                    .accessibilityLabel(
                        viewMode == .map ? "Show vendor list" : "Show map"
                    )
                }
            }
        }
    }

    private func toggleView() {
        withAnimation {
            viewMode = (viewMode == .map) ? .list : .map
        }
    }
}
