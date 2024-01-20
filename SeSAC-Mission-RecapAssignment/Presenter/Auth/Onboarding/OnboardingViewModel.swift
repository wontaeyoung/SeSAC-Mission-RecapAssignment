//
//  OnboardingViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

final class OnboardingViewModel: ViewModel {
  
  weak var coordinator: AuthCoordinator?
  
  init(coordinator: AuthCoordinator) {
    self.coordinator = coordinator
  }
  
  @MainActor
  func showNicknameSettingViewController() {
    coordinator?.showNicknameSettingViewController()
  }
}
