//
//  Plant.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import Foundation
import SwiftUI


struct Plant: Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var nextDate: Date
    var notes: String
    let createdAt: Date
    let image: Image
}


extension Plant {
    static let savings = Plant(
        name: "Jim",
        type: "Savings",
        nextDate: Date(timeIntervalSinceNow: 60 * 60 * 24),
        notes: "Save for a car!",
        createdAt: .now,
        image: Image(.whiteFlower)
    )

    static let investment = Plant(
        name: "Ellie",
        type: "Investment",
        nextDate: .now,
        notes: "Learning about investments",
        createdAt: .now,
        image: Image(.whiteFlower)
    )
}
