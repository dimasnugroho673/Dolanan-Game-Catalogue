//
//  UserData.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 27/08/21.
//

import Foundation

struct UserDataModel: Codable {
  var name: String
  var email: String
  var phoneNumber: String
  var website: String
  var githubUrl: String
  var profilePicture: Data
}
