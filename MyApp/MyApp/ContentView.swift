import SwiftUI
import MapKit
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Vendor.updatedAt, order: .reverse) private var vendors: [Vendor]

    @State private var selectedVendor: Vendor?
    @State private var showingAddVendor = false

    private let nycRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
        span: MKCoordinateSpan(latitudeDelta: 0.35, longitudeDelta: 0.35)
    )

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Map(initialPosition: .region(nycRegion), selection: $selectedVendor) {
                    ForEach(vendors) { vendor in
                        Annotation(
                            vendor.name,
                            coordinate: CLLocationCoordinate2D(
                                latitude: vendor.latitude,
                                longitude: vendor.longitude
                            )
                        ) {
                            Image(systemName: "mappin.circle.fill")
                                .font(.title2)
                        }
                        .tag(vendor)
                    }
                }
                .navigationTitle("MPC+")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showingAddVendor = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(item: $selectedVendor) { vendor in
                    VendorDetailView(vendor: vendor)
                }
                .sheet(isPresented: $showingAddVendor) {
                    VendorFormView()
                }

                if vendors.isEmpty {
                    VStack(spacing: 10) {
                        Text("No vendors yet")
                            .font(.headline)
                        Text("Add a vendor to see it on the map.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Button("Add Vendor") {
                            showingAddVendor = true
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding()
                }
            }
        }
        .onAppear {
            seedVendorsIfNeeded()
        }
    }

    private func seedVendorsIfNeeded() {
        guard vendors.isEmpty else { return }

        let seed: [Vendor] = [
            Vendor(name: "Manhattan Plumbing Supply", address: "Manhattan, NY", phone: "2125550101", website: "https://example.com", latitude: 40.7440, longitude: -73.9950),
            Vendor(name: "Brooklyn Pipe and Valve", address: "Brooklyn, NY", phone: "7185550102", website: "https://example.com", latitude: 40.6782, longitude: -73.9442),
            Vendor(name: "Queens Supply Co", address: "Queens, NY", phone: "3475550103", website: "https://example.com", latitude: 40.7282, longitude: -73.7949),
            Vendor(name: "Bronx Plumbing Warehouse", address: "Bronx, NY", phone: "9175550104", website: "https://example.com", latitude: 40.8448, longitude: -73.8648),
            Vendor(name: "Staten Island Supply", address: "Staten Island, NY", phone: "9295550105", website: "https://example.com", latitude: 40.5795, longitude: -74.1502),
            Vendor(name: "Harlem Plumbing Mart", address: "Harlem, NY", phone: "6465550106", website: "https://example.com", latitude: 40.8116, longitude: -73.9465),
            Vendor(name: "Astoria Plumbing Supply", address: "Astoria, NY", phone: "7185550107", website: "https://example.com", latitude: 40.7644, longitude: -73.9235),
            Vendor(name: "Downtown Plumbing Depot", address: "Lower Manhattan, NY", phone: "2125550108", website: "https://example.com", latitude: 40.7081, longitude: -74.0086),
        ]

        for vendor in seed {
            modelContext.insert(vendor)
        }
    }
}

struct VendorDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showingEdit = false

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
                    if !vendor.phone.isEmpty {
                        Link(vendor.phone, destination: URL(string: "tel:\(vendor.phone)")!)
                    } else {
                        Text("No phone")
                    }
                    if let url = safeURL(vendor.website) {
                        Link(vendor.website, destination: url)
                    } else {
                        Text("No website")
                    }
                }
                Section {
                    Button("Open Directions") {
                        openDirections()
                    }
                    Button("Edit") {
                        showingEdit = true
                    }
                    Button("Delete", role: .destructive) {
                        modelContext.delete(vendor)
                    }
                }
            }
            .navigationTitle("Details")
            .sheet(isPresented: $showingEdit) {
                VendorFormView(editingVendor: vendor)
            }
        }
    }

    private func safeURL(_ value: String) -> URL? {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return nil }
        if trimmed.hasPrefix("http://") || trimmed.hasPrefix("https://") {
            return URL(string: trimmed)
        }
        return URL(string: "https://\(trimmed)")
    }

    private func openDirections() {
        let coordinate = CLLocationCoordinate2D(latitude: vendor.latitude, longitude: vendor.longitude)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.name = vendor.name
        mapItem.openInMaps()
    }
}

struct VendorFormView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    var editingVendor: Vendor?

    @State private var name = ""
    @State private var category = "Plumbing Supply"
    @State private var address = ""
    @State private var phone = ""
    @State private var website = ""
    @State private var notes = ""
    @State private var latitude = ""
    @State private var longitude = ""

    private var isValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !address.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        Double(latitude) != nil &&
        Double(longitude) != nil
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Company") {
                    TextField("Name", text: $name)
                    TextField("Category", text: $category)
                }
                Section("Location") {
                    TextField("Address", text: $address)
                    TextField("Latitude", text: $latitude)
                        .keyboardType(.decimalPad)
                    TextField("Longitude", text: $longitude)
                        .keyboardType(.decimalPad)
                }
                Section("Contact") {
                    TextField("Phone", text: $phone)
                        .keyboardType(.phonePad)
                    TextField("Website", text: $website)
                        .keyboardType(.URL)
                    TextField("Notes", text: $notes, axis: .vertical)
                }
            }
            .navigationTitle(editingVendor == nil ? "Add Vendor" : "Edit Vendor")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { save() }
                        .disabled(!isValid)
                }
            }
            .onAppear {
                loadIfEditing()
            }
        }
    }

    private func loadIfEditing() {
        guard let v = editingVendor else { return }
        name = v.name
        category = v.category
        address = v.address
        phone = v.phone
        website = v.website
        notes = v.notes ?? ""
        latitude = String(v.latitude)
        longitude = String(v.longitude)
    }

    private func save() {
        guard let lat = Double(latitude), let lon = Double(longitude) else { return }

        if let v = editingVendor {
            v.name = name
            v.category = category
            v.address = address
            v.phone = phone
            v.website = website
            v.notes = notes.isEmpty ? nil : notes
            v.latitude = lat
            v.longitude = lon
            v.updatedAt = Date()
        } else {
            let newVendor = Vendor(
                name: name,
                category: category,
                address: address,
                phone: phone,
                website: website,
                notes: notes.isEmpty ? nil : notes,
                latitude: lat,
                longitude: lon
            )
            modelContext.insert(newVendor)
        }

        dismiss()
    }
}

#Preview {
    ContentView()
}
