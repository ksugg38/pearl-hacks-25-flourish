//
//  ProfileView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var user: Profile
    @Binding var currentUser: Profile

    var body: some View {
        NavigationStack {
            ZStack {
                Color.creamGradientTop
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                    VStack {
                        Text("Profile")
                            .padding(.top, 10)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.text)

                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 320, height: 320)
                                .foregroundColor(Color.plantCardGreen)

                            user.profileImage
                                .resizable()
                                .frame(width: 300, height: 300)
                                .scaledToFill()
                                .clipShape(Circle())
                        }

                        Spacer()

                        VStack(alignment: .leading) {
                            List {
                                Text("**Name:** \(user.name)")
                                    .listRowBackground(Color.creamGradientTop)
                                Text("**Number of Plants:** \(user.numPlants)")
                                    .listRowBackground(Color.creamGradientTop)
                                Text("**Friends:** \(user.friends.count)")
                                    .listRowBackground(Color.creamGradientTop)
                                Text("**Group:** \(user.group)")
                                    .listRowBackground(Color.creamGradientTop)
                                Text("**Bio:** \(user.bio)")
                                    .listRowBackground(Color.creamGradientTop)
                                Text("**Financial Interests:** \(user.financialInterests.joined(separator: ", "))")
                                    .listRowBackground(Color.creamGradientTop)
                            }
                            .scrollContentBackground(.hidden)
                            .background(Color.creamGradientTop)
                            .frame(height: 300)
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        ProfileEditView(profile: $user)
                    } label: {
                        Text("Edit")
                    }
                    .disabled(currentUser.name != user.name)
                }
            }
        }
    }
}


#Preview {
    @Previewable @State var user: Profile = .ellie
    @Previewable @State var user2: Profile = .jim
    
    ProfileView(user: $user, currentUser: $user)
}
