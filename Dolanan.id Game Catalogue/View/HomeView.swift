//
//  HomeView.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            
            
            Text("Welcome to Dolanan.id!")
            
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
