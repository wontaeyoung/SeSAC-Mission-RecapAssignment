//
//  Constant.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import UIKit

enum Constant {
  
  enum Network {
    static var requestTimeLimit: Double { return 10 }
    static var resourceTimeLimit: Double { return 15 }
  }
  
  enum Profile {
    static let profileList: [UIImage] = [.profile1, .profile2, .profile3, .profile4, .profile5,
                                         .profile6, .profile7, .profile8, .profile9, .profile10,
                                         .profile11, .profile12, .profile13, .profile14]
  }
  
  enum Storyboard: String {
    case Onboarding
    
    var name: String {
      return self.rawValue
    }
  }
}
