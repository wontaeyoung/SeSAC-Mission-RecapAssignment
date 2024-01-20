//
//  RADesign.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

enum RADesign {
  
  enum Font {
    case onboardingTitle
    case primaryButtonTitle
    case caption
    
    var font: UIFont {
      switch self {
        case .onboardingTitle:
          return .systemFont(ofSize: 45, weight: .bold)
          
        case .primaryButtonTitle:
          return .systemFont(ofSize: 17, weight: .black)
          
        case .caption:
          return .systemFont(ofSize: 13)
      }
    }
  }
}
