//
//  PlantCardView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct PlantCardView: View {
    @Binding var plant: Plant
    var body: some View {
        Text("PlantCardView")
    }
}

#Preview("Plant Card") {
    @Previewable @State var savingsPlant = Plant(
        name: "Planty",
        type: "Savings",
        nextDate: Date(timeIntervalSinceNow: 60 * 60 * 24),
        notes: "Save for a car!",
        createdAt: .now,
        image: Image(.whiteFlower)
    )
    PlantCardView(plant: $savingsPlant)
}
