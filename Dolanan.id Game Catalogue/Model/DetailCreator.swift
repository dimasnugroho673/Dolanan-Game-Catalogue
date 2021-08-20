//
//  DetailCreator.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 20/08/21.
//

import Foundation

struct DetailCreatorModel: Codable {
    let description: String
    let rating: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case rating
    }
    
}
