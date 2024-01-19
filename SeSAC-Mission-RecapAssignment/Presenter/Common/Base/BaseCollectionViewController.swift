//
//  BaseCollectionViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

class BaseCollectionViewController: BaseViewController {
  @MainActor func register() { }
  @MainActor func setLayout() { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    register()
    setLayout()
  }
}
