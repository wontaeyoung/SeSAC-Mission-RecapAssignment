//
//  UIView+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

extension UIView {
  
  func setCornerRadius(
    radius: CGFloat,
    border: (color: UIColor, width: CGFloat)? = nil
  ) {
    self.clipsToBounds = true
    self.layer.cornerRadius = radius
   
    if let border {
      self.layer.borderColor = border.color.cgColor
      self.layer.borderWidth = border.width
    }
  }
}
