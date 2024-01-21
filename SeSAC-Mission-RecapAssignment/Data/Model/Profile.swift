//
//  Profile.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

extension User {
  enum Profile: String, CaseIterable, Codable {
    
    case profile1, profile2, profile3, profile4, profile5, profile6, profile7, profile8, profile9, profile10, profile11, profile12, profile13, profile14
    
    var image: UIImage? {
      return UIImage(named: self.rawValue)
    }
    
    static var allImages: [UIImage] {
      return allCases.map { $0.image! }
    }
    
    static var randomProfileImage: UIImage? {
      User.default.profile = allCases.randomElement()!
      return User.default.profile.image
    }
  }
}
