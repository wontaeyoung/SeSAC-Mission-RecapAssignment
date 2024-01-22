//
//  SettingTableViewCell.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

import UIKit

final class SettingProfileCell: UITableViewCell {
  static var identifier: String {
    return String(describing: Self.self)
  }
  
  override func awakeFromNib() {
    contentView.backgroundColor = .darkGray
  }
}

final class SettingTableViewCell: UITableViewCell {
  static var identifier: String {
    return String(describing: Self.self)
  }
  
  override func awakeFromNib() {
    contentView.backgroundColor = .darkGray
  }
}
