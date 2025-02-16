//
//  ProfileEditView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI

struct ProfileEditView: View {
    @Binding var profile: Profile
    let types = ["Savings", "Investment", "Budget", "Small Businesses"]
    var body: some View {
        NavigationStack{
            Form {
                Section("User") {
                    TextField("Name", text: $profile.name)
                }
            
                Section("Finances Goals") {
                    TextField("Financial Goals", text: $profile.financialGoals, axis: .vertical)
                        .lineLimit(3...)
    
                    
//                    Picker("Select Plant Type", selection: $profile.financialInterests) {
//                        ForEach(types, id: \.self) {
//                            Text($0)
//                        }
//                    }
//                    .pickerStyle(.menu)
                }
                
                Section("Created Profile On"){
                    Text("\(formattedCreateDate)")
                        .foregroundStyle(.secondary)
                }
            }
                .navigationTitle("Edit")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    private var formattedCreateDate: String {
        profile.dateJoined.formatted(date: .long, time: .shortened)
    }
}

#Preview {
    @Previewable @State var profile: Profile = .ellie
    ProfileEditView(profile: $profile)
}
