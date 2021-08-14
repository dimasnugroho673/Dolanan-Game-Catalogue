//
//  ProfileView.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.openURL) var openURL
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView(.vertical) {
            ZStack(alignment: .top) {
                VStack {
                    VStack {
                        Image("profile_dimas_greyscle")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        Text("Dimas Nugroho Putro")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                    }
                    .padding(.top, 20)
                    
                    Spacer().frame(height: 30)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Image(systemName: "envelope")
                            Text("dimasnugroho673@gmail.com")
                        }
                        
                        HStack {
                            Image(systemName: "phone")
                            Text("082285592029")
                        }
                        
                        HStack {
                            Image(systemName: "network")
                            Text("dimasnugroho673.github.io")
                        }
                    }
                    
                    Spacer().frame(height: 50)
                    
                    Button(action: {openURL(URL(string: "https://github.com/dimasnugroho673?tab=repositories")!)}) {
                        HStack {
                            Spacer()
                            
                            HStack {
                                Image(colorScheme == .light ? "icon_github_white" : "icon_github_black")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                
                                Text("View on GitHub")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            
                            Spacer()
                        }
                    }
                    .frame(width: 230, height: 50)
                    .background(colorScheme == .light ? Color.black : Color.white)
                    .foregroundColor(colorScheme == .light ? Color.white : Color.black)
                    .cornerRadius(15)
                    
                }
                
                
                
            }
        }
        .navigationTitle("Profile").navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
        // Add your custom back button here
        .navigationBarItems(leading:
                                Button(action: {
                                    self.presentation.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Image(systemName: "chevron.backward.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(colorScheme == .light ? .black : .white)
                                    }
                                })
        
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
