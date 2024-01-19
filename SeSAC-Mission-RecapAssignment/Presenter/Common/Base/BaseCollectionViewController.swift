//
//  BaseCollectionViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

class BaseCollectionViewController: BaseViewController {
  
  /// Override해서 셀 등록 작업을 해주세요.
  @MainActor func register() { }
  /// Override해서 CollectionViewFlowLayout을 설정해주세요.
  @MainActor func setLayout() { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    register()
    setLayout()
  }
}
