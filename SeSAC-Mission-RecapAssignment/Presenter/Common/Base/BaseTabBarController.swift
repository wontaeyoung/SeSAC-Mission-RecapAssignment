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
    
    view.backgroundColor = .raBackground
    tabBar.tintColor = .accent
    tabBar.backgroundColor = .raBackground
  }
}
