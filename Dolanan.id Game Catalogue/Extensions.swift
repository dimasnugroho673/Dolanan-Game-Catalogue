//
//  Extensions.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 23/08/21.
//

import Foundation

extension String {
    // filter string
    var stripped: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890.,")
        return self.filter {okayChars.contains($0) }
    }

    // first capital character
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
