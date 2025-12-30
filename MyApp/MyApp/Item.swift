//
//  Item.swift
//  MyApp
//
//  Created by Dylan Clark on 12/30/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
