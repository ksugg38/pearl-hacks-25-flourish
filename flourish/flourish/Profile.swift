//
//  Profile.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import Foundation
import SwiftUI


struct Profile: Identifiable {
    let id = UUID()
    var name: String
    let dateJoined: Date
    var financialInterests: [String]
    var financialGoals: String
    let profileImage: Image
    let friends: [Profile]
}


extension Profile {
    static let jim = Profile(
        name: "Jim",
        dateJoined: .now,
        financialInterests: ["Savings", "Investments"],
        financialGoals: "Save for a car!",
        profileImage: Image(.guyProfile),
        friends: []
    )

    static let ellie = Profile(
        name: "Ellie",
        dateJoined: .now,
        financialInterests: ["Small Businesses", "Investments"],
        financialGoals: "Starting an Etsy shop",
        profileImage: Image(.girlProfile),
        friends: [jim]
    )
    
    static let pam = Profile(
        name: "Pam",
        dateJoined: .now,
        financialInterests: ["Small Businesses", "Budget"],
        financialGoals: "Being smarter with money",
        profileImage: Image(.girlProfile),
        friends: [jim, ellie]
    )
}
