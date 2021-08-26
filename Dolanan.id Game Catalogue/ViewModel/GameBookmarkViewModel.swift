//
//  GameBookmarkViewMode.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 18/08/21.
//

import Foundation

class GameBookmarkViewModel: ObservableObject {
  
  @Published var items: [GameBookmarkModel] = [] {
    didSet {
      saveItems()
    }
  }
  
  let key: String = "GamesBookmark"
  
  init() {
    fetchItems()
  }
  
  func fetchItems() {
    guard
      let data = UserDefaults.standard.data(forKey: key),
      let savedItems = try? JSONDecoder().decode([GameBookmarkModel].self, from: data)
    else { return }
    
    self.items = savedItems
  }
  
  func deleteItem(index: Int) {
    items.remove(at: index)
  }
  
  func addItem(data: GameBookmarkModel) {
    let newItem = GameBookmarkModel(id: data.id, name: data.name, genres: data.genres, rating: data.rating, backgroundImage: data.backgroundImage, screenshots: data.screenshots)
    items.append(newItem)
  }
  
  func saveItems() {
    if let encodedData = try? JSONEncoder().encode(items) {
      UserDefaults.standard.set(encodedData, forKey: key)
    }
  }
}
