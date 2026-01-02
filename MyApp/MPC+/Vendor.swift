import Foundation
import SwiftData

@Model
final class Vendor {
    var id: UUID
    var name: String
    var categories: [String]
    var address: String
    var phone: String
    var website: String
    var notes: String?
    var latitude: Double
    var longitude: Double
    var createdAt: Date
    var updatedAt: Date

    init(
        name: String,
        categories: [String],
        address: String,
        phone: String,
        website: String,
        notes: String? = nil,
        latitude: Double,
        longitude: Double
    ) {
        self.id = UUID()
        self.name = name
        self.categories = categories
        self.address = address
        self.phone = phone
        self.website = website
        self.notes = notes
        self.latitude = latitude
        self.longitude = longitude
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}
