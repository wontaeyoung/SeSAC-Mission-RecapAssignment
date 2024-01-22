//
//  AuthCoordinator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

final class AuthCoordinator: SubCoordinator {
  
  // MARK: - Property
  weak var delegate: CoordinatorDelegate?
  var navigationController: UINavigationController
  var childCoordinators: [Coordinator]
  
  // MARK: - Intializer
  init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
    self.childCoordinators = []
  }
  
  // MARK: - Method
  func start() {
    showOnboardingViewController()
  }
}

extension AuthCoordinator {
  
  private func showOnboardingViewController() {
    let viewModel = OnboardingViewModel(coordinator: self)
    let viewController = makeViewController(
      storyboard: .Onboarding,
      viewController: OnboardingViewController.self
    ) as! OnboardingViewController
    
    viewController.setViewModel(viewModel)
    self.push(viewController, animation: false)
  }
  
  func showNicknameSettingViewController() {
    let viewModel = NicknameSettingViewModel(coordinator: self)
    let viewController = makeViewController(
      storyboard: .ProfileSetting,
      viewController: NicknameSettingViewController.self
    ) as! NicknameSettingViewController
    
    viewController.setViewModel(viewModel)
    viewController.setNavigationTitle(with: "프로필 설정")
    self.push(viewController)
  }
  
  func showProfileImageSttingViewController() {
    let viewModel = ProfileImageSettingViewModel(coordinator: self)
    let viewController = makeViewController(
      storyboard: .ProfileSetting,
      viewController: ProfileImageSettingViewController.self
    ) as! ProfileImageSettingViewController
    
    viewController.setViewModel(viewModel)
    viewController.setNavigationTitle(with: "프로필 수정")
    self.push(viewController)
  }
}
