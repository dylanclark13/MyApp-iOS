import Foundation
struct Vendor: Identifiable, Hashable {
let id: UUID = UUID()
var name: String
var category: String
var address: String
var phone: String
var website: String
var notes: String?
var latitude: Double
var longitude: Double
}
//
//  Vendor.swift
//  MyApp
//
//  Created by Dylan Clark on 12/30/25.
//

