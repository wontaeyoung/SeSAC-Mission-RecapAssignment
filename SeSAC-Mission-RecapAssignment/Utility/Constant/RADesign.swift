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
    case plain
    case plainBold
    case caption
    case captionBold
    
    var font: UIFont {
      switch self {
        case .onboardingTitle:
          return .systemFont(ofSize: 40, weight: .bold)
          
        case .primaryButtonTitle:
          return .systemFont(ofSize: 17, weight: .black)
          
        case .plain:
          return .systemFont(ofSize: 15)
          
        case .plainBold:
          return .systemFont(ofSize: 15, weight: .bold)
          
        case .caption:
          return .systemFont(ofSize: 13)
          
        case .captionBold:
          return .systemFont(ofSize: 13, weight: .bold)
      }
    }
  }
  
  enum Image {
    case search
    case setting
    case delete
    case like
    case likeFill
    
    var image: UIImage? {
      switch self {
        case .search:
          return UIImage(systemName: "magnifyingglass")
          
        case .setting:
          return UIImage(systemName: "person")
          
        case .delete:
          return UIImage(systemName: "xmark")
          
        case .like:
          return UIImage(systemName: "heart")
          
        case .likeFill:
          return UIImage(systemName: "heart.fill")
      }
    }
  }
}
