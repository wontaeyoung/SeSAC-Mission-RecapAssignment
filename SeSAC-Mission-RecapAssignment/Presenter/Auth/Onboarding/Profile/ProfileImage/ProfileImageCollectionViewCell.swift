//
//  ProfileImageCollectionViewCell.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class ProfileImageCollectionViewCell: BaseCollectionViewCell {
  
  @IBOutlet weak var profileImageView: UIImageView!
  
  override func setNeedsLayout() {
    DesignSystemManager.configureProfileImageView(profileImageView)
  }
}
