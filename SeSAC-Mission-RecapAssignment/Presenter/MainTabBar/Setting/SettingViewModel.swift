//
//  SettingViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

final class SettingViewModel: ViewModel {
  weak var coordinator: SettingCoordinator?
  
  init(coordinator: SettingCoordinator) {
    self.coordinator = coordinator
  }
  
  func showSettingViewController() {
    coordinator?.showSettingViewController()
  }
  
  func showNicknameSettingViewController() {
    coordinator?.showNicknameSettingViewController()
  }
  
  @MainActor
  func resetProfile() {
    User.default.resetProfile()
    coordinator?.end()
  }
}
