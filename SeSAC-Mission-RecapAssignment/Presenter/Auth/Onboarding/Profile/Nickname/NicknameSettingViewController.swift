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
  
  @MainActor
  override func configure() {
    self.finishableKeyboardEditing = true
    
    DesignSystemManager.configureNicknameFeild(nicknameField)
    DesignSystemManager.configureHintLabel(hintLabel)
    DesignSystemManager.configurePrimaryButton(finishButton)
  }
  
  override func setAttribute() {
    profileImageView.image = User.default.profile.image
    profileImageView.addGestureRecognizer(
      UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
    )
    
    nicknameField.placeholder = "닉네임을 입력해주세요 :)"
    nicknameField.text = User.default.nickname
    nicknameField.addTarget(self, action: #selector(textfieldDidChanged), for: .editingChanged)
    
    finishButton.setTitle("완료", for: .normal)
    finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    
    toggleFinishButton()
    textfieldDidChanged(nicknameField)
  }
  
  func setViewModel(_ viewModel: NicknameSettingViewModel) {
    self.viewModel = viewModel
  }
  
  func setNavigationTitle(with title: String) {
    self.navigationItem.title = title
    self.navigationItem.backButtonTitle = ""
  }
  
  @objc private func profileImageTapped() {
    viewModel?.showProfileImageSttingViewController()
  }
  
  @objc private func finishButtonTapped(_ sender: UIButton) {
    applyNickname()
    
    if User.default.onboarded {
      viewModel?.coordinator?.pop()
    } else {
      onboardingCompleted()
    }
  }
  
  private func applyNickname() {
    User.default.nickname = nicknameField.text!
  }
  
  private func onboardingCompleted() {
    User.default.onboarded = true
    
    viewModel?.connectMainTabBarFlow()
  }
  
  private func updateProfile() {
    User.default.nickname = nicknameField.text!
  }
}

// MARK: - 닉네임 유효성
extension NicknameSettingViewController {
  @objc private func textfieldDidChanged(_ sender: UITextField) {
    let validation = viewModel?.validateNickname(sender.text!)
    
    updateHintText(validation?.hintText)
    changeHintColor(isValid: validation == .satisfied)
    changeFinishButtonEnabled(isValid: validation == .satisfied)
  }
  
  private func updateHintText(_ text: String?) {
    hintLabel.text = text
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
