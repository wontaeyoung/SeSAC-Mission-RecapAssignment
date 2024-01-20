//
//  UITextField+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/20/24.
//

import UIKit

extension UITextField {
  
  func setPlaceholderColor(_ color: UIColor) {
    attributedPlaceholder = NSAttributedString(
      string: placeholder ?? "",
      attributes: [
        .foregroundColor: color,
        .font: font
      ]
    )
  }
  
}
