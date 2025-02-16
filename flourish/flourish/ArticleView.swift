//
//  ArticleView.swift
//  flourish
//
//  Created by Katie Sugg on 2/16/25.
//


import SwiftUI

struct ArticleView: View {
    @Binding var articleRead: Bool

    var body: some View {
        VStack {
            
            Text("")
                .onAppear {
                    articleRead = true
                }
            
            Image("article")
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 800)
        }
        .navigationTitle("Article")
    }
}

#Preview {
    @Previewable @State var articleRead = false
    ArticleView(articleRead: $articleRead)
}
