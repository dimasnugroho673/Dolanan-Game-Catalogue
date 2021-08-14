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
    
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var dataCreators = [Result]() {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var isLoading = true
    @Published var errorMessage: String = ""
    
    init() {
        guard let url = URL(string: "\(Constants.API)creators?key=\(Constants.API_KEY)") else {
            fatalError("Error while get url")
        }
     
         URLSession.shared.dataTask(with: url) { (data, response, error) in
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
                  
              } catch let err {
                  self.errorMessage = "Gagal memuat data : \(err.localizedDescription)"
                  print("Error : \(err.localizedDescription)")
              }
          
         }.resume()
    }
    
}
