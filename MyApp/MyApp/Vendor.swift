import Foundation
import SwiftData
@Model
final class Vendor {
var id: UUID
var name: String
var category: String
var address: String
var phone: String
var website: String
var notes: String?
var latitude: Double
var longitude: Double
var createdAt: Date
var updatedAt: Date
init(
    id: UUID = UUID(),
    name: String,
    category: String = "Plumbing Supply",
    address: String,
    phone: String = "",
    website: String = "",
    notes: String? = nil,
    latitude: Double,
    longitude: Double,
    createdAt: Date = Date(),
    updatedAt: Date = Date()
) {
    self.id = id
    self.name = name
    self.category = category
    self.address = address
    self.phone = phone
    self.website = website
    self.notes = notes
    self.latitude = latitude
    self.longitude = longitude
    self.createdAt = createdAt
    self.updatedAt = updatedAt
}
}

//
//  Vendor.swift
//  MyApp
//
//  Created by Dylan Clark on 12/30/25.
//

