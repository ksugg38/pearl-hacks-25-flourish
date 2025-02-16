//
//  CommunityView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct CommunityView: View {
    let groups: [String] = ["UNC Chapel Hill", "BossBabes", "RTP", "Small Business Owners"]
    @Binding var user: Profile

    var body: some View {
        NavigationStack { // Wrap entire view in NavigationStack
            ZStack {
                Color.creamGradientTop
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Community")
                        .padding(.top, 10)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.text)
                    
                    Spacer()
                    
                    Text("My Friends' Gardens")
                        .font(.headline)
                        .foregroundStyle(Color.text)
                    
                    List {
                        ForEach($user.friends, id: \.id) { $friend in
                            NavigationLink(destination: ProfileView(user: $friend, currentUser: $user)) {
                                HStack {
                                    Text(friend.name)
                                        .foregroundStyle(Color.text)
                                        .padding()
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color.topBarGreen)
                                
                                .cornerRadius(10)
                
                                .shadow(color: Color.plantCardGreen, radius: 2, x: -5, y: 5)
                            }
                            .listRowBackground(Color.clear) // Remove default background
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.creamGradientTop)
                    
                    Text("Add Friend +")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 48)
                        .foregroundStyle(Color.text)
                        .background(Color.topBarGreen, in: .capsule)
                        .shadow(color: Color.plantCardGreen, radius: 2, x: -5, y: 5)
                    Spacer()

                    Text("Groups and Organizations")
                        .font(.headline)
                        .foregroundStyle(Color.text)
                    
                    List {
                        ForEach(groups, id: \.self) { group in
                            HStack {
                                Text(group)
                                    .foregroundColor(Color.text)  // Updated from 'foregroundStyle' to 'foregroundColor'
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
                }
                .padding()
            }
        } // Make sure NavigationStack is around the entire content
    }
}


#Preview {
    @Previewable @State var user: Profile = .ellie
    CommunityView(user: $user)
}
