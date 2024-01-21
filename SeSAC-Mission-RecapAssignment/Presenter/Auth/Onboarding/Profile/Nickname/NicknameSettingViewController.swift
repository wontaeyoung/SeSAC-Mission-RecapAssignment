//
//  NicknameSettingViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/20/24.
//

import UIKit

final class NicknameSettingViewController: BaseViewController, Navigatable, ViewModelController {
  
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var nicknameField: UITextField!
  @IBOutlet weak var hintLabel: UILabel!
  @IBOutlet weak var finishButton: UIButton!
  
  private var viewModel: NicknameSettingViewModel?
  private var isFinishButtonEnable: Bool = false {
    didSet {
      toggleFinishButton()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    profileImageView.image = User.default.profile.image
  }
  
  override func viewDidLayoutSubviews() {
    DesignSystemManager.configureProfileImageView(profileImageView)
    DesignSystemManager.configureSelectedImageView(profileImageView)
  }
  
  override func configure() {
    DesignSystemManager.configureNicknameFeild(nicknameField)
    DesignSystemManager.configureHintLabel(hintLabel)
    DesignSystemManager.configurePrimaryButton(finishButton)
  }
  
  override func setAttribute() {
    navigationItem.title = "프로필 설정"
    navigationItem.backButtonTitle = ""
    
    profileImageView.image = User.Profile.randomProfileImage
    profileImageView.addGestureRecognizer(
      UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
    )
    
    nicknameField.placeholder = "닉네임을 입력해주세요 :)"
    nicknameField.addTarget(self, action: #selector(textfieldDidChanged), for: .editingChanged)
    
    finishButton.setTitle("완료", for: .normal)
    toggleFinishButton()
  }
  
  func setViewModel(_ viewModel: NicknameSettingViewModel) {
    self.viewModel = viewModel
  }
  
  @objc private func profileImageTapped() {
    viewModel?.showProfileImageSttingViewController()
  }
}

// MARK: - 닉네임 유효성
extension NicknameSettingViewController {
  @objc private func textfieldDidChanged(_ sender: UITextField) {
    let validation = viewModel?.validateNickname(sender.text!)
    
    changeHintColor(isValid: validation == .satisfied)
    changeFinishButtonEnabled(isValid: validation == .satisfied)
    hintLabel.text = validation?.hintText
  }
  
  private func changeHintColor(isValid: Bool) {
    hintLabel.textColor = isValid ? .accent : .red
  }
  
  private func changeFinishButtonEnabled(isValid: Bool) {
    isFinishButtonEnable = isValid
  }
  
  private func toggleFinishButton() {
    finishButton.isEnabled = isFinishButtonEnable
    finishButton.backgroundColor = isFinishButtonEnable ? .accent : .gray
  }
}
