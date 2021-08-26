//
//  DetailGame.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 17/08/21.
//

import Foundation

struct DetailGameModel: Codable {
  let name: String
  let backgroundImage: String
  let rating: Float
  let descriptionRaw: String
  let released: String
  var ageRating: AgeRating
  var parentPlatforms: [ParentPlatforms]
  let playtime: Int
  let website: String
  let metacriticURL: String
  var genres: [Genres]
  
  enum CodingKeys: String, CodingKey {
    case name
    case backgroundImage = "background_image"
    case rating
    case descriptionRaw = "description_raw"
    case released
    case ageRating = "esrb_rating"
    case parentPlatforms = "parent_platforms"
    case playtime
    case website
    case metacriticURL = "metacritic_url"
    case genres
  }
}

struct AgeRating: Codable {
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case name
  }
}

struct ParentPlatforms: Codable {
  let childPlatform: ChildPlatform
  
  enum CodingKeys: String, CodingKey {
    case childPlatform = "platform"
  }
}

struct ChildPlatform: Codable {
  let name: String
  
  enum CodingKeys: String, CodingKey {
    case name
  }
}

struct GameBookmarkModel: Codable {
  var id: Int
  var name: String
  var genres: [Genres]
  var rating: Int
  var backgroundImage: String
  var screenshots: [Screenshots]
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case genres
    case rating
    case backgroundImage
    case screenshots
  }
}
