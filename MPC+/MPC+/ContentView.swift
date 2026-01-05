import SwiftUI

struct ContentView: View {

    enum ViewMode {
        case map
        case list
    }

    @State private var viewMode: ViewMode = .map

    var body: some View {
        NavigationStack {
            ZStack {
                switch viewMode {
                case .map:
                    VendorMapView()
                case .list:
                    VendorListView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        toggleView()
                    } label: {
                        Text(viewMode == .map ? "List" : "Map")
                    }
                    .accessibilityLabel("Toggle map and list view")
                }
            }
            .navigationTitle("MPC+")
        }
    }

    private func toggleView() {
        withAnimation {
            viewMode = (viewMode == .map) ? .list : .map
        }
    }
}
