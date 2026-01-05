//
//  VendorDetailView.swift
//  MPC+
//
//  Created by Dylan Clark on 1/5/26.
//
import SwiftUI

struct VendorDetailView: View {

    let vendor: Vendor

    var body: some View {
        List {
            Section {
                Text(vendor.name)
                    .font(.title2)
                    .fontWeight(.semibold)
            }

            Section("Contact") {
                if !vendor.phone.isEmpty {
                    Text(vendor.phone)
                }

                if !vendor.website.isEmpty {
                    Link(vendor.website, destination: URL(string: vendor.websiteWithScheme)!)
                }
            }

            Section("Location") {
                Text(vendor.address)
            }

            if let notes = vendor.notes, !notes.isEmpty {
                Section("Notes") {
                    Text(notes)
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
