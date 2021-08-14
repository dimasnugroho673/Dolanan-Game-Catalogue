//
//  CreatorRow.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI

struct CreatorRow: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meet creators")
                .font(.title3)
                .bold()
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(0...5, id: \.self) { game in
                        NavigationLink(destination: CreatorRow()) {
                            Spacer()
                            Spacer()
                            Image("creator_dummy")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80)
                                .clipShape(Circle())
                        }
                    }
                }
            }
        }
    }
}

struct CreatorRow_Previews: PreviewProvider {
    static var previews: some View {
        CreatorRow()
    }
}
