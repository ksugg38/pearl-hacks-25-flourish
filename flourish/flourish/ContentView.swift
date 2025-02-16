//
//  ContentView.swift
// Garden/Home View
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var plants: [Plant] = [.savings, .investment]
//    @State private var plants: [Plant] = []
//    @State private var profiles: [Profile] = [.jim, .ellie, .pam]
    @State private var user: Profile = .ellie
    @State private var currentUser: Profile = .ellie
    @State private var searchText = ""
    @State private var isHome: Bool = true
    @State var flipped = false // state variable used to update the card

    @State private var showingNewPlantView: Bool = false
    var body: some View {
        ZStack {
            // Background Image
//                    Image(.background)
//                        .resizable()
//                        .scaledToFit()
//                        .edgesIgnoringSafeArea(.all) // Make sure it extends behind the entire view

            VStack {
//                Spacer()

                HStack(alignment: .firstTextBaseline) {
//                    Spacer()
//                    Text("6:54")
//                        .fontWeight(.bold)
//
//                    Spacer()
                    Spacer()
//                    Spacer()
//                    Image(systemName: "cellularbars")
//                    Image(systemName: "wifi")
//                    Image(systemName: "battery.25percent")
//                        .padding(.trailing)
                }
                .padding(.top)
                .padding(.trailing)
                .foregroundStyle(Color.text)
                .edgesIgnoringSafeArea(.all)
                .background(Color.topBarGreen)

                Spacer()

                // Tab View

                TabView {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }

                    SearchView(plants: $plants, searchText: $searchText)
                        .searchable(text: $searchText, prompt: "Search by type")
                        .tint(Color.plantCardGreen)
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }

                    Button {
                        showingNewPlantView = true
                    } label: {
                        VStack {
                            Text("Add Plant")
                                .padding(.top, 10)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.text)
                            Spacer()
                            Image(.logo)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .rotation3DEffect(
                                    flipped ? Angle(degrees: 180) : Angle(degrees: 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        flipped.toggle()
                                    }
                                }

                            Text("Add a New Plant +")
                                .padding(.vertical, 16)
                                .padding(.horizontal, 48)
                                .foregroundStyle(.white)
                                .background(Color.topBarGreen, in: .capsule)
                                .shadow(color: Color.plantCardGreen, radius: 2, x: -5, y: 5)
                            Spacer()
                            Spacer()
                        }
                        .containerRelativeFrame([.horizontal, .vertical])
                        .background(Color.creamGradientTop.edgesIgnoringSafeArea(.all))
                        .onAppear {
                            withAnimation(.easeInOut(duration: 0.6).repeatCount(2, autoreverses: true)) {
                                flipped.toggle()
                            }
                        }
                    }
                    .tabItem {
                        Label("New Plant", systemImage: "plus")
                    }
                    .sheet(isPresented: $showingNewPlantView) {
                        NewPlantView(plants: $plants)
                    }

                    CommunityView(user: $user)
                        .tabItem {
                            Label("Community", systemImage: "person.2")
                        }

                    ProfileView(user: $user, currentUser: $user)
                        .tabItem {
                            Label("Profile", systemImage: "person.crop.circle")
                        }
                }

                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .background(Color.creamGradientTop)
    }
}

#Preview {
    ContentView()
}
