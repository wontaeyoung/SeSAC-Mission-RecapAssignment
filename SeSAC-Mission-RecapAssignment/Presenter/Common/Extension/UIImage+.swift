//
//  UIImage+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

extension UIImage {
  
  func configured(size: CGFloat? = nil, color: UIColor) -> UIImage {
    var image: UIImage = self
    
    if let size {
      let font: UIFont = .systemFont(ofSize: size)
      let config = SymbolConfiguration(font: font)
      
      image = image.withConfiguration(config)
    }
    
    return image
      .withTintColor(color, renderingMode: .alwaysOriginal)
  }
}

