//
//  CreatorRow.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI
import URLImage

struct CreatorRow: View {
    
    var creators: [Result]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Meet creators")
                .font(.title3)
                .bold()
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(self.creators, id: \.id) { creator in
                        NavigationLink(destination: CreatorDetailView()) {
                            Spacer()
                            Spacer()
                            URLImage(URL(string: creator.image)!) { image in
                                image
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75)
                                    .clipShape(Circle())
                            }
                            .frame(width: 75, height: 80)
                        }
                    }
                }
            }
        }
    }
}

//struct CreatorRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatorRow()
//    }
//}
