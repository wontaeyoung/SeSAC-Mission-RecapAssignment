//
//  SettingProfileTableViewCell.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

import UIKit

final class SettingProfileTableViewCell: BaseTableViewCell {
  
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var likeCountInfoLabel: UILabel!
  
  override func configure() {
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      
      DesignSystemManager.configureProfileImageView(profileImageView)
      DesignSystemManager.configureSelectedImageView(profileImageView)
      DesignSystemManager.configureNicknameLabel(nicknameLabel)
      DesignSystemManager.configureLikeCountLabel(likeCountInfoLabel)
    }
  }
  
  override func setAttribute() {
    self.profileImageView.image = User.default.profile.image
    self.nicknameLabel.text = User.default.nickname
    self.likeCountInfoLabel.text = "\(User.default.likes.count)개의 상품을 좋아하고 있어요!"
  }
}
