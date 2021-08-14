//
//  SearchView.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI

struct SuggesstionGames: Identifiable {
    var id = UUID()
    var title: String
}

struct SearchView: View {
    
    @State var keyword = ""
    @State private var isEditing = false
    @State var suggesstionGames = [
        // data by https://www.tomsguide.com/news/best-games-of-2021
        SuggesstionGames(title: "Final Fantasy VII Remake Intergrade"),
        SuggesstionGames(title: "Hitman 3"),
        SuggesstionGames(title: "Mass Effect Legendary Edition "),
        SuggesstionGames(title: "Ratchet & Clank: Rift Apart"),
        SuggesstionGames(title: "Returnal"),
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView() {
                    VStack(alignment: .leading) {
                        HStack {
                            TextField("Search game", text: $keyword)
                                .padding(7)
                                .padding(.horizontal, 25)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .overlay(
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.gray)
                                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading, 8)
                                        
                                        if isEditing {
                                            Button(action: {
                                                self.keyword = ""
                                            }) {
                                                Image(systemName: "multiply.circle.fill")
                                                    .foregroundColor(.gray)
                                                    .padding(.trailing, 8)
                                            }
                                        }
                                    }
                                )
                                .padding(.horizontal, 15)
                                .onTapGesture {
                                    self.isEditing = true
                                }
                                .animation(.default)
                            
                            if isEditing {
                                Button(action: {
                                    self.isEditing = false
                                    self.keyword = ""
                                    
                                    // Dismiss the keyboard
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                }) {
                                    Text("Cancel")
                                }
                                .padding(.trailing, 10)
                                .transition(.move(edge: .trailing))
                                .animation(.default)
                            }
                        }
                        
                        if (self.keyword == "") {
                            VStack(alignment: .leading) {
                                Text("Top rate game")
                                    .font(.title2)
                                    .bold()
                                    .padding(.leading, 10)
                                    .padding(.top, 40)
                                
                                List {
                                    ForEach(suggesstionGames, id: \.id) { game in
                                        HStack {
                                            Text(game.title)
                                                .foregroundColor(.blue)
                                            Spacer()
                                                
                                        }
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            self.isEditing = true
                                            self.keyword = game.title
                                        }
                                    }
                                }
                            }.frame(height: geometry.size.height)
                        } else {
                            Text("Result search")
                        }
                        
                        
                        
                    }
                    
                    
                    
                }
                .padding(.bottom, 10)
                
                .navigationTitle("Search")
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
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
