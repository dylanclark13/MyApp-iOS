import SwiftUI

struct ContentView: View {
    @State private var showingList = false
    @State private var showingFilters = false
    @State private var selectedCategories: Set<String> = []

    var body: some View {
        NavigationStack {
            Group {
                if showingList {
                    VendorListView(selectedCategories: selectedCategories)
                } else {
                    VendorMapView(selectedCategories: selectedCategories)
                }
            }
            .navigationTitle("MPC+")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showingFilters = true
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingList.toggle()
                    } label: {
                        Image(systemName: showingList ? "map" : "list.bullet")
                    }
                }
            }
        }
        .sheet(isPresented: $showingFilters) {
            FilterView(selectedCategories: $selectedCategories)
        }
    }
}
