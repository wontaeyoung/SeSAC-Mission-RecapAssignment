//
//  BaseTableViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

class BaseTableViewController: BaseViewController {
  
  /// Override해서 셀 등록 작업
  @MainActor func register() { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    register()
  }
}
