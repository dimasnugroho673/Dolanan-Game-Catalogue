//
//  GameLikedViewModel.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 20/08/21.
//

import Foundation

class GameLikedViewModel: ObservableObject {

  private let key: String = "GamesLiked"

  @Published var items: [Int] = [] {
    didSet {
      saveItems()
    }
  }

  init() {
    fetchItems()
  }

  func fetchItems() {
    guard
      let savedItems =  UserDefaults.standard.array(forKey: key) as? [Int]
    else {
      return
    }

    self.items = savedItems
  }

  func addItem(id: Int) {
    items.append(id)
  }

  func saveItems() {
    UserDefaults.standard.set(items, forKey: key)
  }

  func deleteItem(index: Int) {
    items.remove(at: index)
  }

}
