//
//  OnboardingView.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 22/08/21.
//

import SwiftUI

struct OnboardingView: View {
  
  @Environment(\.presentationMode) private var presentation
  @State private var activeImage = 0
  @Binding var isUserExist: Bool
  
  private let imagesShow = ["img_onboarding", "img_onboarding2", "img_onboarding3"]
  private let timerShowcase = Timer.publish(every: 4, on: .main, in: .common).autoconnect()

  @ObservedObject var userData = UserDataViewModel()
  
  var body: some View {
    ZStack {
      Image(imagesShow[activeImage])
        .resizable()
        .aspectRatio(contentMode: .fill)
        .animation(.spring())
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .overlay(
          Rectangle()
            .fill(
              LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
            .opacity(0.7)
        )
        .onReceive(timerShowcase) { _ in
          self.activeImage = (self.activeImage + 1) % self.imagesShow.count
        }
      
      HStack {
        VStack {
          Text("Find your best game")
            .foregroundColor(.white)
            .font(.title)
            .bold()
          
          Text("Explore - Discover - Play")
            .foregroundColor(Color.init(.systemGray3))
            .font(.subheadline)
            .padding(.top, 5)

          Button(action: {
            UserDefaults.standard.setValue(true, forKey: "UserExist")
            userData.addItem(data: UserDataModel(name: "Dimas Nugroho Putro", email: "dimasnugroho673@gmail.com", phoneNumber: "082285592029", website: "dimasnugroho673.github.io", githubUrl: "https://github.com/dimasnugroho673", profilePicture: Data()))
            self.isUserExist = true
            self.presentation.wrappedValue.dismiss()
          }, label: {
            Text("Get started")
              .font(.body)
              .fontWeight(.bold)
          })
          .buttonStyle(StartOnboardingButtonStyle())
          .padding(.top, 20)
        }
        .padding()
      }
      .padding(.bottom, 20)
      .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .bottom)
    }
    .ignoresSafeArea(.all)
  }
}

struct StartOnboardingButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .font(.headline)
      .frame(maxWidth: .infinity, maxHeight: 45, alignment: .center)
      .contentShape(Rectangle())
      .foregroundColor(configuration.isPressed ? Color.accentColor.opacity(0.5) : Color.accentColor)
      .listRowBackground(configuration.isPressed ? Color.accentColor.opacity(0.5) : Color.accentColor)
      .background(Color.init(.systemGray6))
      .cornerRadius(10)
  }
}
