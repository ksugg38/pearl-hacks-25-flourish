//
//  NewPlantView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI


struct NewPlantView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var newPlantName: String = ""
    @State private var newType: String = ""
    @State private var newNextDate: Date = .now
    @State private var newNotes: String = ""
    @State private var newImage: Image = Image(.whiteFlower)
    let types = ["Savings", "Investment", "Budget", "Small Businesses"]

    @Binding var plants: [Plant]
    var body: some View {
        NavigationStack{
            Form {
                Section("Plant Info") {
                    TextField("Plant Name", text: $newPlantName)
                        .lineLimit(1...)
                    
                    
                    Picker("Select Plant Type", selection: $newType) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section("Notes") {
                    TextField("Notes (optional)", text: $newNotes, axis: .vertical)
                        .lineLimit(3...)
                }
                
                Section("Date to Revisit Plant"){
                    DatePicker(
                        "Date",
                        selection: $newNextDate,
                        displayedComponents: [.date]
                    )
                }
            }
            .navigationTitle("New Plant")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let newPlant = Plant(
                            name: newPlantName,
                            type: newType,
                            nextDate: newNextDate,
                            notes: newNotes,
                            createdAt: .now,
                            image: newImage
                        )
                        plants.append(newPlant)
                        dismiss()
                        let _ = print("hi!")
                        

                    } label: {
                        Text("Add")
                    }
                    .disabled(newType == "")
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var plants: [Plant] = []
    NewPlantView(plants: $plants)
}
