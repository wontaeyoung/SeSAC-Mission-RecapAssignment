//
//  BaseTabBarController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

class BaseTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tabBar.tintColor = .accent
    tabBar.unselectedItemTintColor = .systemGray
    tabBar.backgroundColor = .raBackground
  }
}
