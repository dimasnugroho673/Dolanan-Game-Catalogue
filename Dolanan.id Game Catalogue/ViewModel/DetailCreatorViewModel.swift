//
//  DetailCreatorViewModel.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 20/08/21.
//

import Foundation
import SwiftUI
import Combine

class DetailCreatorViewModel: ObservableObject {
  
  @Published var isLoading = true
  @Published var errorMessage: String = ""
  @Published var detailCreator: DetailCreatorModel?
  
  func loadData(id: Int) {
    guard let url = URL(string: "\(Constants.api)creators/\(id)?key=\(Constants.apiKey)") else {
      fatalError("Error while get url")
    }
    
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      guard let data = data, error == nil else {
        print("Error : \(error!.localizedDescription)")
        self.errorMessage = "Gagal memuat data : \(error!.localizedDescription)"
        return
      }

      do {
        let result = try JSONDecoder().decode(DetailCreatorModel.self, from: data)

        self.isLoading = false
        DispatchQueue.main.async {
          self.detailCreator = result
        }
        
      } catch let error {
        self.errorMessage = "Gagal memuat data : \(error.localizedDescription)"
        print("Error : \(error.localizedDescription)")
      }
    }.resume()
  }
}
