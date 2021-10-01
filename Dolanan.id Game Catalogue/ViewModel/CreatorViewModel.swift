//
//  CreatorViewModel.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import Foundation
import SwiftUI
import Combine

class CreatorViewModel: ObservableObject {

  @Published var dataCreators = [Result]()
  
  @Published var isLoading = true
  @Published var errorMessage: String = ""
  
  init() {
    guard let url = URL(string: "\(Constants.api)creators?key=\(Constants.apiKey)") else {
      fatalError("Error while get url")
    }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      guard let data = data, error == nil else {
        print("Error : \(error!.localizedDescription)")
        self.errorMessage = "Gagal memuat data : \(error!.localizedDescription)"
        return
      }
      
      do {
        let result = try JSONDecoder().decode(CreatorModel.self, from: data)
        
        self.isLoading = false
        DispatchQueue.main.async {
          self.dataCreators = result.results
        }
      } catch let error {
        self.errorMessage = "Gagal memuat data : \(error.localizedDescription)"
        print("Error : \(error.localizedDescription)")
      }
    }.resume()
  }
}
