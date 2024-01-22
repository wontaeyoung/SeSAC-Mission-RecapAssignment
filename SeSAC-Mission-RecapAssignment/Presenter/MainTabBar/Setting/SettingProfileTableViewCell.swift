//
//  SettingProfileTableViewCell.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

import UIKit

final class SettingProfileTableViewCell: UITableViewCell {
  
  static var identifier: String {
    return String(describing: Self.self)
  }
  
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nicknameLabel: UILabel!
  @IBOutlet weak var likeCountInfoLabel: UILabel!
  
  override func awakeFromNib() {
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      
      DesignSystemManager.configureProfileImageView(profileImageView)
      DesignSystemManager.configureSelectedImageView(profileImageView)
      DesignSystemManager.configureNicknameLabel(nicknameLabel)
      DesignSystemManager.configureLikeCountLabel(likeCountInfoLabel)
      
      updateProfile()
    }
  }
  
  func updateProfile() {
    profileImageView.image = User.default.profile.image
    nicknameLabel.text = User.default.nickname
    likeCountInfoLabel.attributedText = "\(User.default.likes.count)개의 상품을 좋아하고 있어요!".colorAttributed(rangeText: "\(User.default.likes.count)개의 상품")
  }
}
