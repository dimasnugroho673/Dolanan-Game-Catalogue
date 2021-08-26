//
//  CreatorRow.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CreatorRow: View {
  
  var creators: [Result]
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Meet creators")
        .font(.title3)
        .bold()
        .padding(.leading, 15)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top) {
          ForEach(self.creators, id: \.id) { creator in
            NavigationLink(destination: CreatorDetailView(id: creator.id, name: creator.name, image: creator.image, imageBackground: creator.imageBackground, gamesCount: creator.gamesCount, positions: creator.positions, games: creator.games)) {
              Spacer()
              Spacer()
              WebImage(url: URL(string: creator.image)!)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 75)
                .clipShape(Circle())
            }
          }
        }
      }
    }
  }
}
