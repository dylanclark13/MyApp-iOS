//
//  VendorDetailView.swift
//  MyApp
//
//  Created by Dylan Clark on 12/30/25.
//

import SwiftUI
import SwiftData
import MapKit

struct VendorDetailView: View {
    @Environment(\.modelContext) private var modelContext

    let vendor: Vendor

    var body: some View {
        List {
            Section("Company") {
                Text(vendor.name)
                    .font(.headline)
                Text(vendor.category)
                    .foregroundStyle(.secondary)
            }

            Section("Location") {
                Text(vendor.address)
                Text("\(vendor.latitude), \(vendor.longitude)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Section("Contact") {
                if let phoneURL = phoneURL {
                    Link(vendor.phone, destination: phoneURL)
                } else {
                    Text("No phone")
                }

                if let websiteURL = websiteURL {
                    Link(vendor.website, destination: websiteURL)
                } else {
                    Text("No website")
                }
            }

            Section {
                Button("Get Directions") {
                    openDirections()
                }

                Button("Delete Vendor", role: .destructive) {
                    modelContext.delete(vendor)
                }
            }
        }
        .navigationTitle("Vendor")
    }

    private var phoneURL: URL? {
        let digits = vendor.phone.filter { $0.isNumber }
        guard !digits.isEmpty else { return nil }
        return URL(string: "tel:\(digits)")
    }

    private var websiteURL: URL? {
        let trimmed = vendor.website.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return nil }

        if trimmed.hasPrefix("http://") || trimmed.hasPrefix("https://") {
            return URL(string: trimmed)
        }
        return URL(string: "https://\(trimmed)")
    }

    private func openDirections() {
        let coordinate = CLLocationCoordinate2D(
            latitude: vendor.latitude,
            longitude: vendor.longitude
        )

        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        mapItem.name = vendor.name
        mapItem.openInMaps()
    }
}
