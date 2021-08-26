//
//  SearchGameViewModel.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 17/08/21.
//

import Foundation
import SwiftUI
import Combine

class SearchGameViewModel: ObservableObject {
  
  let objectWillChange = ObservableObjectPublisher()
  
  @Published var isLoading = true
  @Published var errorMessage: String = ""
  @Published var resultSearching = [ResultPopularGame]() {
    willSet {
      objectWillChange.send()
    }
  }
  
  func loadData(keyword: String) {
    let keywordToURL = keyword.replacingOccurrences(of: " ", with: "+")
    guard let url = URL(string: "\(Constants.api)games?search=\(keywordToURL)&key=\(Constants.apiKey)") else {
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
          self.resultSearching = result.results
        }
        
      } catch let error {
        self.errorMessage = "Gagal memuat data : \(error.localizedDescription)"
        print("Error : \(error.localizedDescription)")
      }
    }.resume()
  }
}
