//
//  UIAlertController+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

extension UIAlertController {
  func addActions(_ actions: UIAlertAction...) {
    actions.forEach { self.addAction($0) }
  }
  
  func setAction(
    title: String?,
    style: UIAlertAction.Style = .default,
    completion: (() -> Void)? = nil
  ) -> UIAlertController {
    let alertAction = UIAlertAction(title: title, style: style) { _ in
      completion?()
    }
    
    addAction(alertAction)
    
    return self
  }
  
  func setCancelAction() -> UIAlertController {
    return setAction(title: "취소", style: .cancel)
  }
}
