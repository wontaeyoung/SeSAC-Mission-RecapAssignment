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
  
  enum Storyboard: String {
    case Onboarding
    case ProfileSetting
    case Main
    
    var name: String {
      return self.rawValue
    }
  }
}
