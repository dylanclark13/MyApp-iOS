import SwiftUI

struct ContentView: View {
    @State private var showingList = false

    var body: some View {
        NavigationStack {
            Group {
                if showingList {
                    VendorListView()
                } else {
                    VendorMapView()
                }
            }
            .navigationTitle("MPC+")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingList.toggle()
                    } label: {
                        Image(systemName: showingList ? "map" : "list.bullet")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
