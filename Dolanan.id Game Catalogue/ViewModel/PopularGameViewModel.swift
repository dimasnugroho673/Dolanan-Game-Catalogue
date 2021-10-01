//
//  PopularGameViewModel.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 15/08/21.
//

import Foundation
import SwiftUI
import Combine

class PopularGameViewModel: ObservableObject {
  
  @Published var dataPopularGame = [ResultPopularGame]()
  
  @Published var isLoading = true
  @Published var errorMessage: String = ""
  
  init() {
    guard let url = URL(string: "\(Constants.api)games?key=\(Constants.apiKey)&page=1") else {
      fatalError("Error while get url")
    }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      guard let data = data, error == nil else {
        print("Error : \(error!.localizedDescription)")
        self.errorMessage = "Gagal memuat data : \(error!.localizedDescription)"
        return
      }
      
      do {
        let result = try JSONDecoder().decode(PopularGameModel.self, from: data)
        
        self.isLoading = false
        DispatchQueue.main.async {
          self.dataPopularGame = result.results
        }
      } catch let error {
        self.errorMessage = "Gagal memuat data : \(error.localizedDescription)"
        print("Error : \(error.localizedDescription)")
      }
    }.resume()
  }
}
