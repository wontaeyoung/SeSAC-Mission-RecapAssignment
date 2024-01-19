//
//  BaseTableViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

class BaseTableViewController: BaseViewController {
  @MainActor func register() { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    register()
  }
}
