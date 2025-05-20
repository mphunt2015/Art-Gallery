//
//  Item.swift
//  Image Gallery
//
//  Created by Michael Hunt on 5/20/25.
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
