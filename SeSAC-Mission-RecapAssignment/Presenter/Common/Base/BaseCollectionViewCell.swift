//
//  BaseCollectionViewCell.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
  
  class var identifier: String {
    return String(describing: self)
  }
  
  @MainActor func configure() { }
  @MainActor func setAttribute() { }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.backgroundColor = .clear
    self.contentView.backgroundColor = .clear
    
    configure()
    setAttribute()
  }
}
