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
    var numPlants: Int
    var group: String
    var bio: String
    var financialInterests: [String]
    var financialGoals: String
    let profileImage: Image
    let friends: [Profile]
}


extension Profile {
    static let jim = Profile(
        name: "Jim",
        dateJoined: .now,
        numPlants: 14,
        group: "UNC Chapel Hill",
        bio: "As an avid gardener, I joined this app to make managing my financials fun!",
        financialInterests: ["Savings", "Investments"],
        financialGoals: "Save for a car!",
        profileImage: Image(.guyProfile),
        friends: []
    )

    static let ellie = Profile(
        name: "Ellie",
        dateJoined: .now,
        numPlants: 5,
        group: "Small Business Owners",
        bio: "I aim to make a big garden from my success as a small business owner.",
        financialInterests: ["Small Businesses", "Investments"],
        financialGoals: "Starting an Etsy shop",
        profileImage: Image(.girlProfile),
        friends: [jim]
    )
    
    static let pam = Profile(
        name: "Pam",
        dateJoined: .now,
        numPlants: 9,
        group: "App Team",
        bio: "If you go to  UNC Chapel Hill, add me!",
        financialInterests: ["Small Businesses", "Budget"],
        financialGoals: "Being smarter with money",
        profileImage: Image(.girlProfile),
        friends: [jim, ellie]
    )
    
    static let rico = Profile(
        name: "Rico",
        dateJoined: .now,
        numPlants: 11,
        group: "App Team",
        bio: "Whasssup!",
        financialInterests: ["Investment"],
        financialGoals: "Get more money",
        profileImage: Image(.guyProfile),
        friends: []
        )
}

