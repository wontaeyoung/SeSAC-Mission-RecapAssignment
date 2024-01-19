//
//  BaseViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

class BaseViewController: UIViewController {
  @MainActor func setAttribute() { }
  @MainActor func setUI() { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .raBackground
    
    setAttribute()
    setUI()
  }
}
