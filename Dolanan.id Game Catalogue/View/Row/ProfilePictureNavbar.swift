//
//  ProfilePictureNavbar.swift
//  Dolanan.id Game Catalogue
//
//  Created by Dimas Putro on 28/08/21.
//

import SwiftUI

struct ProfilePictureNavbar: View {

  @EnvironmentObject var userData: UserDataViewModel

  @State var profileImageData: Data = Data()

    var body: some View {
      VStack {
        if !profileImageData.isEmpty {
          let decoded = (try? PropertyListDecoder().decode(Data.self, from: profileImageData)) ??  Data()

          Image(uiImage: UIImage(data: decoded)!)
            .resizable()
            .renderingMode(.original)
            .frame(width: 37, height: 37)
            .clipShape(Circle())
        } else {
          Image("profile_dummy")
            .resizable()
            .renderingMode(.original)
            .frame(width: 37, height: 37)
            .clipShape(Circle())
        }
      }
      .onAppear {
        self.userData.fetchItem()
        self.profileImageData = userData.item?.profilePicture ?? Data()
      }
    }
}

struct ProfilePictureNavbar_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureNavbar()
    }
}
