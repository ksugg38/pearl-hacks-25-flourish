//
//  PlantCardView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct PlantCardView: View {
    @Binding var plant: Plant
    @State private var performedTask: Bool = false
    let investArticles = ["Intro to Investing", "Learn about Roth IRAs", "Where Should I invest?"]
    let saveGoals = ["Save $1000 by 2/15/25", "Do not remove any $ before Feb ", "Save for spring break"]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.creamGradientTop.edgesIgnoringSafeArea(.all)

                VStack {
                    Text(plant.name)
                        .padding(.top, 10)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.text)

                    Text(plant.type)
                        .foregroundStyle(Color.text)
                        .italic()

                    ZStack {
                        if performedTask {
                            if plant.type == "Investment"{
                                Image("fullGrown")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 200)
                            }else{
                                Image("bigFlower")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 200)
                            }
                            
                        } else {
                            if plant.type == "Investment"{
                                Image("sprout")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 200)
                                
                            }else{
                                Image("littleFlower")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 200)
                            }
                            
                        }
                    }
                    
                    if plant.type == "Investment"{
                        List {
                            ForEach(investArticles, id: \.self) { article in
                                NavigationLink(destination: ArticleView(articleRead: $performedTask)) {
                                    HStack {
                                        Text(article)
                                            .foregroundStyle(Color.text)
                                            .padding()
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(Color.topBarGreen)
                                    .cornerRadius(10)
                                    .shadow(color: Color.plantCardGreen, radius: 2, x: -5, y: 5)
                                }
                                .listRowBackground(Color.clear)
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color.creamGradientTop)
                        
                    }else{
                        List {
                            ForEach(saveGoals, id: \.self) { group in
                                HStack {
                                    Text(group)
                                        .foregroundColor(Color.text)
                                        .padding()
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color.topBarGreen)
                                .cornerRadius(10)
                                .shadow(color: Color.plantCardGreen, radius: 2, x: -5, y: 5)
                                .listRowBackground(Color.clear)
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color.creamGradientTop)
                        
                        Button {
                            performedTask = true
                        } label: {
                            Text("Goal Reached!")
                                .padding(.vertical, 16)
                                .padding(.horizontal, 48)
                                .foregroundStyle(Color.text)
                                .background(Color.topBarGreen, in: .capsule)
                                .shadow(color: Color.plantCardGreen, radius: 2, x: -5, y: 5)
                        }
                    }

                    
                }
            }
        }
    }
}

#Preview("Plant Card") {
    @State var savingsPlant = Plant(
        name: "Investment 1",
        type: "Investment",
        nextDate: Date(timeIntervalSinceNow: 60 * 60 * 24),
        notes: "Invest for the future!",
        createdAt: .now,
        image: Image("whiteFlower") // Change to string image name
    )
    PlantCardView(plant: $savingsPlant)
}
