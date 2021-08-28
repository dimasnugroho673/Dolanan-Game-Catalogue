//
//  Dolanan_id_Game_CatalogueApp.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import SwiftUI

@main
struct DolananIdGameCatalogueApp: App {

  @StateObject var userData: UserDataViewModel = UserDataViewModel()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(userData)
    }
  }
}
