//
//  GameRow.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI

struct GameRow: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Popular Game")
                .font(.title3)
                .bold()
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(0...5, id: \.self) { game in
                        NavigationLink(destination: MovieDetailView()) {
                            Spacer()
                            Spacer()
                            VStack(alignment: .leading, spacing: 10) {
                                Image("cover_game_dummy")
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300)
                                    .clipped()
                                    .cornerRadius(5)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("Naruto Ultimate Ninja Storm 4")
                                        .foregroundColor(.primary)
                                        .font(.headline)
                                }
                            }
                            .frame(width: 300)
                            .cornerRadius(10)
                            .clipped()
                        }
                    }
                }
            }
        }
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow()
    }
}
