//
//  ListGamesView.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 21/08/21.
//

import SwiftUI

struct ListGamesView: View {
  
  let navTitle: String
  let games: [Games]
  
  var body: some View {
    VStack {
      List {
        ForEach(games, id: \.id) { game in
          NavigationLink(destination: GameDetailView(id: game.id)) {
            Text(game.name)
          }
        }
      }
      
      .navigationTitle(navTitle)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}
