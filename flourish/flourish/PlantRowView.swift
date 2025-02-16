//
//  PlantRowView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct PlantRowView: View {
    @Binding var plant: Plant
    var body: some View {
        HStack{
            plant.image
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(.circle)
            Text("\(plant.name)")
            
        }
    }
}

#Preview("Plant Row") {
    @Previewable @State var savingsPlant = Plant(
        name: "Planty",
        type: "Savings",
        nextDate: Date(timeIntervalSinceNow: 60 * 60 * 24),
        notes: "Save for a car!",
        createdAt: .now,
        image: Image(.whiteFlower)
    )
    
    PlantRowView(plant: $savingsPlant)
    
}
