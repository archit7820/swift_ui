//
//  Item.swift
//  dashboard
//
//  Created by Abhi Chaudhary on 05/05/24.
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
