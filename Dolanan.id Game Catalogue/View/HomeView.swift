//
//  HomeView.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var carouselIndex: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        
                        TabView(selection: self.$carouselIndex) {
                            ForEach(0...5, id: \.self) { index in
                                Image("carousel_dummy")
                                    .resizable()
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .tag(carouselIndex)
                            }
                        }
                        .frame(height: 200)
                        .tabViewStyle(PageTabViewStyle())
                        
                        GameRow()
                            .padding(.top, 20)
                        
                        CreatorRow()
                            .padding(.top, 20)
                        
                        
                    }
                    .padding(.bottom, 10)
                    
                }
                .navigationTitle("Home")
                .navigationBarItems(trailing:
                                        NavigationLink(destination: ProfileView()) {
                                            Image("profile_dimas_greyscle")
                                                .resizable()
                                                .renderingMode(.original)
                                                .frame(width: 37, height: 37)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
