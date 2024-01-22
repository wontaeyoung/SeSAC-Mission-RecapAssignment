//
//  BaseCollectionViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

class BaseCollectionViewController: BaseViewController {
  
  /// Override해서 셀 등록 작업
  @MainActor func register() { }
  /// Override해서 CollectionViewFlowLayout 설정
  @MainActor func setLayout() { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    register()
    setLayout()
  }
}
