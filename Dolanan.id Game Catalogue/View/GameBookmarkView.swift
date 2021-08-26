//
//  BookmarkView.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 18/08/21.
//

import SwiftUI

struct GameBookmarkView: View {

  @ObservedObject var gameBookmarkData = GameBookmarkViewModel()

  var body: some View {
    NavigationView {
      VStack {
        if gameBookmarkData.items.isEmpty {
          Text("No bookmark added")
            .foregroundColor(.gray)
        } else {
          List {
            ForEach(Array(gameBookmarkData.items.enumerated()), id: \.1.id) { (index, game) in
              NavigationLink(destination: GameDetailView(id: game.id, title: game.name, rating: game.rating, backgroundImage: game.backgroundImage, genres: game.genres, screenshots: game.screenshots, indexArrayOfGameBookmark: index)) {
                Text("\(game.name)")
              }
            }
          }
          .listStyle(PlainListStyle())
        }
      }
      .onAppear {
        gameBookmarkData.fetchItems()
      }
      
      .navigationTitle("Bookmark")
      .navigationBarTitleDisplayMode(.large)
    }
  }
}

struct BookmarkView_Previews: PreviewProvider {
  static var previews: some View {
    GameBookmarkView()
  }
}
