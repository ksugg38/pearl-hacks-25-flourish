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
        Text("Search Plants")
            .font(.title)
        NavigationStack{
            
            List($plants, id: \.id){ $plant in
                if searchText.isEmpty || plant.name.lowercased().contains(searchText.lowercased()) {
                    NavigationLink {
                        PlantCardView(plant: $plant)
                    } label: {
                        PlantRowView(plant: $plant)
                    }
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



