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
                .frame(width: 50, height: 50)
                .clipShape(.circle)
            Spacer()
            Text("\(plant.name)")
                .foregroundStyle(Color.text)
            
        }
        .padding()
        .background(Color.topBarGreen)
        
        .cornerRadius(10)

        .shadow(color: Color.plantCardGreen, radius: 2, x: -5, y: 5)
        .foregroundColor(Color.text)

    }
}

#Preview("Plant Row") {
    @Previewable @State var savingsPlant = Plant(
        name: "Car Savings",
        type: "Savings",
        nextDate: Date(timeIntervalSinceNow: 60 * 60 * 24),
        notes: "Save for a car!",
        createdAt: .now,
        image: Image(.sunFlower)
    )
    
    PlantRowView(plant: $savingsPlant)
    
}
