//
//  DetailGameViewModel.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 17/08/21.
//

import Foundation
import SwiftUI
import Combine

class DetailGameViewModel: ObservableObject {
  
  @Published var isLoading = true
  @Published var errorMessage: String = ""
  @Published var detailGame: DetailGameModel?

  func loadData(id: Int) {
    guard let url = URL(string: "\(Constants.api)games/\(id)?key=\(Constants.apiKey)") else {
      fatalError("Error while get url")
    }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      guard let data = data, error == nil else {
        print("Error : \(error!.localizedDescription)")
        self.errorMessage = "Gagal memuat data : \(error!.localizedDescription)"
        
        return
      }
      
      do {
        let result = try JSONDecoder().decode(DetailGameModel.self, from: data)
        
        self.isLoading = false
        
        DispatchQueue.main.async {
          self.detailGame = result
        }
        
      } catch let error {
        self.errorMessage = "Gagal memuat data : \(error.localizedDescription)"
        print("Error : \(error.localizedDescription)")
      }
    }.resume()
  }
}
