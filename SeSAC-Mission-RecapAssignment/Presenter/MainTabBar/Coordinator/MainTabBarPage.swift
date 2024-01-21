//
//  MainTabBarPage.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

enum MainTabBarPage: Int, CaseIterable {
  case search = 0
  case setting
  
  var index: Int {
    self.rawValue
  }
  
  var title: String {
    switch self {
      case .search:
        return "검색"
        
      case .setting:
        return "설정"
    }
  }
  
  var icon: UIImage? {
    switch self {
      case .search:
        return RADesign.Image.search.image
        
      case .setting:
        return RADesign.Image.setting.image
    }
  }
  
  var tabBarItem: UITabBarItem {
    return UITabBarItem(title: title, image: icon, tag: index)
  }
}
