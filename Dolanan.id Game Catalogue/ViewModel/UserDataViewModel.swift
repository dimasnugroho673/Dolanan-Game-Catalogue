//
//  UserDataViewModel.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 27/08/21.
//

import Foundation
import SwiftUI
import Combine

class UserDataViewModel: ObservableObject {

  private let key: String = "UserData"

  @Published var item: UserDataModel? {
    didSet {
      saveItem()
    }
  }

  init() {
    fetchItem()
  }

  func fetchItem() {
    guard
      let data = UserDefaults.standard.data(forKey: key),
      let savedItem = try? JSONDecoder().decode(UserDataModel.self, from: data)
    else {
      return
    }

    self.item = savedItem
  }

  func addItem(data: UserDataModel) {
    let newItem = UserDataModel(name: data.name, email: data.email, phoneNumber: data.phoneNumber, website: data.website, githubUrl: data.githubUrl, profilePicture: data.profilePicture)
    item = newItem
  }

  func saveItem() {
    if let encodedData = try? JSONEncoder().encode(item) {
      UserDefaults.standard.set(encodedData, forKey: key)
    }
  }

}
