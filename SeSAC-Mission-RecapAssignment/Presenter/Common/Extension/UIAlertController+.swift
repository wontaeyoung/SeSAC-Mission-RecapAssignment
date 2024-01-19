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
}
