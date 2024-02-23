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
    
    textfieldDidChanged(nicknameField)
  }
  
  override func bind() {
    viewModel?.outputHintText.bind {
      self.updateHintText($0)
    }
    
    viewModel?.outputValidation.bind {
      self.changeHintColor(isValid: $0)
      self.toggleFinishButton(enabled: $0)
    }
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
    viewModel?.applyNickname(nicknameField.text!)
    viewModel?.switchView()
  }
}

extension NicknameSettingViewController {
  @objc private func textfieldDidChanged(_ sender: UITextField) {
    viewModel?.inputNickname.set(sender.text!)
  }
  
  private func updateHintText(_ text: String?) {
    hintLabel.text = text
  }
  
  private func changeHintColor(isValid: Bool) {
    hintLabel.textColor = isValid ? .accent : .red
  }
  
  private func toggleFinishButton(enabled: Bool) {
    finishButton.isEnabled = enabled
    finishButton.backgroundColor = enabled ? .accent : .gray
  }
}
