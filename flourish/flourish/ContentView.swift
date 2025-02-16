//
//  ContentView.swift
// Garden/Home View
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct ContentView: View {
//    @State private var plants: [Plant] = [.savings, .investment]
    @State private var plants: [Plant] = []
//    @State private var profiles: [Profile] = [.jim, .ellie, .pam]
    @State private var user: Profile = .ellie
    @State private var searchText = ""
    
    @State private var showingNewPlantView: Bool = false
    var body: some View {
        VStack{
            TabView{
                Tab("Home", systemImage: "house"){
                    
                }
                Tab("Search", systemImage: "magnifyingglass"){
                    SearchView(plants: $plants, searchText: $searchText)
                    .searchable(text: $searchText, prompt: "Search by type")
                }
                
                Tab("New Plant", systemImage: "plus"){
                    Button {
                        showingNewPlantView = true
                    } label: {
                        Image(systemName: "plus")
                        Text("Add a New Plant")
                    }
                    .sheet(isPresented: $showingNewPlantView) {
                        NewPlantView(plants: $plants)
                    }
                }
                Tab("Community", systemImage: "person.2"){
                    CommunityView()
                }
                Tab("Profile", systemImage: "person.crop.circle"){
                    ProfileView(user: $user)
                }
            }
        

            
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color.creamGradientTop)
        Spacer()
        
        
    }
}

#Preview {
    ContentView()
}
