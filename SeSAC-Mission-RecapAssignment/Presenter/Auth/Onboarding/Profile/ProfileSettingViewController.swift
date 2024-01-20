//
//  ProfileSettingViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/20/24.
//

import UIKit

final class ProfileSettingViewController: BaseViewController, Navigatable, ViewModelController {
  
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nicknameField: UITextField!
  @IBOutlet weak var hintLabel: UILabel!
  @IBOutlet weak var finishButton: UIButton!
  
  private var viewModel: ProfileSettingViewModel?
  
  override func viewDidLayoutSubviews() {
    DesignSystemManager.configureProfileImageView(profileImageView)
  }
  
  override func setUI() {
    DesignSystemManager.configureNicknameFeild(nicknameField)
    DesignSystemManager.configureHintLabel(hintLabel)
    DesignSystemManager.configurePrimaryButton(finishButton)
  }
  
  override func setAttribute() {
    navigationItem.title = "프로필 설정"
    profileImageView.image = User.Profile.randomProfileImage
    nicknameField.placeholder = "닉네임을 입력해주세요 :)"
    hintLabel.text = "닉네임에 @는 포함할 수 없어요."
    finishButton.setTitle("완료", for: .normal)
  }
  
  func setViewModel(_ viewModel: ProfileSettingViewModel) {
    self.viewModel = viewModel
  }
}
