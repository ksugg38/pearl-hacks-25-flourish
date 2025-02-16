//
//  ProfileView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var user: Profile
    var body: some View {
        NavigationStack{
            Text("\(user.name)")
                .font(.title)
            
            user.profileImage
                .resizable()
                .frame(width: 300, height: 300)
                .scaledToFill()
                .clipShape(.circle)
            Spacer()
            
            VStack(alignment: .leading){
                List{
                    Text("Date Joined: \(user.dateJoined.formatted(date: .long, time: .omitted))")
                    Text("Financial Goals: \(user.financialGoals)")
                    Text("Financial Interests: \(user.financialInterests)")
                    Text("Friends: \(user.friends.count)")

                    
                }
                
                
            }
            .padding()
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink{
                        ProfileEditView(profile: $user)
                    }label:{
                        Text("Edit")
                    }
                }
            }
            
            
        }
    }
}

#Preview {
    @Previewable @State var user: Profile = .ellie
    ProfileView(user: $user)
}
