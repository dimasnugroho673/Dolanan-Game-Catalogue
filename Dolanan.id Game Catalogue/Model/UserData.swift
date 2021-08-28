//
//  UserData.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 27/08/21.
//

import Foundation

struct UserDataModel: Codable {
  let name: String
  let email: String
  let phoneNumber: String
  let website: String
  let githubUrl: String
  let profilePicture: Data
}
