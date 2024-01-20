//
//  AuthCoordinator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

final class AuthCoordinator: Coordinator {
  
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
    print("Show")
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
  
  func showProfileSettingViewController() {
    let viewModel = ProfileSettingViewModel(coordinator: self)
    let viewController = makeViewController(
      storyboard: .ProfileSetting,
      viewController: ProfileSettingViewController.self
    ) as! ProfileSettingViewController
    
    viewController.setViewModel(viewModel)
    self.push(viewController)
  }
}
