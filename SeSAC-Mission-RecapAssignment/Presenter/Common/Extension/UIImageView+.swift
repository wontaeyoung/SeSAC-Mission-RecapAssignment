//
//  UIImageView+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

extension UIImageView {
  
  func setCornerRadius(radius: CGFloat) {
    self.clipsToBounds = true
    self.layer.cornerRadius = radius
  }
}
