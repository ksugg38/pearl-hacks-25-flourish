//
//  SearchView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct SearchView: View {
    @Binding var plants: [Plant]
    @Binding var searchText: String

    var body: some View {
        ZStack {
            Color.creamGradientTop.edgesIgnoringSafeArea(.all)

            VStack {
                Text("My Plants")
                    .padding(.top, 10)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.text)

                NavigationStack {
                    List {
                        ForEach($plants, id: \.id) { $plant in
                            if searchText.isEmpty || plant.name.lowercased().contains(searchText.lowercased()) {
                                NavigationLink {
                                    PlantCardView(plant: $plant)
                                } label: {
                                    HStack {
                                        PlantRowView(plant: $plant)
//                                            .padding()
                                    }
                                    .background(Color.topBarGreen)
                                    
                                    .cornerRadius(10)
                    
                                    .shadow(color: Color.plantCardGreen, radius: 2, x: -5, y: 5)
                                }
                                .listRowBackground(Color.clear) // default styling
                            }
                        }
                    }
//                    .listRowSpacing(10)
                    .scrollContentBackground(.hidden)
                    .background(Color.creamGradientTop)
                }
            }
        }
    }
}


#Preview {
    @Previewable @State var plants: [Plant] = [.savings, .investment]
    @Previewable @State var searchText = ""
    SearchView(plants: $plants, searchText: $searchText)
}
