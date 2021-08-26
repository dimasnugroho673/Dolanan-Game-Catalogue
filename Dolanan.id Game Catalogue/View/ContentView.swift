//
//  ContentView.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI

struct ContentView: View {
  
  @State private var isUserExist = UserDefaults.standard.bool(forKey: "UserExist")
  @State private var isOnboardingPresent = true
  
  var body: some View {
    if isUserExist {
      TabView {
        HomeView()
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }
        
        GenreView()
          .tabItem {
            Image(systemName: "puzzlepiece")
            Text("Genre")
          }
        
        SearchView()
          .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Search")
          }
        
        GameBookmarkView()
          .tabItem {
            Image(systemName: "bookmark")
            Text("bookmark")
          }
      }
    } else {
      VStack {
        
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      .background(Color.white)
      .edgesIgnoringSafeArea(.all)
      .fullScreenCover(isPresented: $isOnboardingPresent, content: {
        OnboardingView(isUserExist: $isUserExist)
      })
    }
  }
}
