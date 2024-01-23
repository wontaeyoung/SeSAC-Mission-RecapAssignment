//
//  BaseViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

class BaseViewController: UIViewController {
  
  var finishableKeyboardEditing: Bool = false
  @MainActor func configure() { }
  @MainActor func setAttribute() { }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .raBackground
    
    configure()
    setAttribute()
    
    if finishableKeyboardEditing { makeViewFinishableEditing() }
  }
  
  private func makeViewFinishableEditing() {
    let gesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
    
    view.addGestureRecognizer(gesture)
  }
  
  @objc private func viewDidTap() {
    view.endEditing(true)
  }
}
