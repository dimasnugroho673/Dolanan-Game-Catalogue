//
//  SearchGameRow.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 17/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchGameRow: View {
  
  var resultSearching: [ResultPopularGame]
  
  var body: some View {
    VStack {
      ForEach(self.resultSearching, id: \.id) { game in
        NavigationLink(destination: GameDetailView(id: game.id, title: game.name, rating: Int(round(game.rating)), backgroundImage: game.backgroundImage, genres: game.genres, screenshots: game.screenshots)) {
          VStack(alignment: .leading, spacing: 15) {
            WebImage(url: URL(string: game.backgroundImage)!)
              .resizable()
              .renderingMode(.original)
              .aspectRatio(contentMode: .fill)
              .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 200)
              .cornerRadius(5)
            
            HStack {
              VStack(alignment: .leading, spacing: 5) {
                Text(game.name)
                  .foregroundColor(.primary)
                  .font(.headline)
                  .frame(maxHeight: 20)
                
                Text(game.genres
                      .map {
                        $0.name
                      }
                      .joined(separator: ", "))
                  .foregroundColor(.gray)
                  .font(.footnote)
                
                HStack(spacing: 3) {
                  ForEach(1...5, id: \.self) { index in
                    Image(systemName: index > Int(round(game.rating)) ? "star" : "star.fill")
                      .resizable()
                      .foregroundColor(Color.gray)
                      .frame(width: 12, height: 12)
                  }
                }
              }
            }
          }
        }
        .padding(.bottom, 20)
      }
    }
  }
}
