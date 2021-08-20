//
//  PopularGame.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 15/08/21.
//

import Foundation

struct PopularGameModel: Codable {
    var results: [ResultPopularGame]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct ResultPopularGame: Codable {
    let id: Int
    let name: String
    let backgroundImage: String
    let rating: Float
    var genres: [Genres]
    var screenshots: [Screenshots]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case backgroundImage = "background_image"
        case rating
        case genres
        case screenshots = "short_screenshots"
    }
}

struct Genres: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

struct Screenshots: Codable {
    let id: Int
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case image
    }
}


