//
//  HomeView.swift
//  flourish
//
//  Created by Katie Sugg on 2/15/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Text("My Garden")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(Color.text)
            WebImage(url: Bundle.main.url(forResource: "garden", withExtension: "gif"))
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 90, height: 600)
        }
            .containerRelativeFrame([.horizontal, .vertical])
        .background(Color.creamGradientTop)
//            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
