//
//  Creator.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 14/08/21.
//

import Foundation

struct CreatorModel: Codable {
    var results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Result: Codable {
    let id: Int
    let name: String
    let image: String
    let imageBackground: String
    let gamesCount: Int
    var positions: [Positions]
    var games: [Games]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case imageBackground = "image_background"
        case gamesCount = "games_count"
        case positions
        case games
    }
}

struct Positions: Codable {
    
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

struct Games: Codable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
