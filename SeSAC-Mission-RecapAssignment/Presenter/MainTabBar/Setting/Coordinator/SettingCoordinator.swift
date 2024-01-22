//
//  SettingCoordinator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class SettingCoordinator: SubCoordinator {
  
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
    configureNavigationBar()
    showSettingViewController()
  }
  
  private func configureNavigationBar() {
    navigationController.navigationBar.configure {
      $0.barTintColor = .raBackground
      $0.tintColor = .raText
      $0.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.raText]
    }
  }
}

extension SettingCoordinator {
  
  func showSettingViewController() {
    let viewModel = SettingViewModel(coordinator: self)
    let viewController = makeViewController(
      storyboard: .Setting,
      viewController: SettingViewController.self
    ) as! SettingViewController
    
    viewController.setViewModel(viewModel)
    self.push(viewController, animation: false)
  }
  
  func showNicknameSettingViewController() {
    let coordinator = AuthCoordinator(self.navigationController)
    self.addChild(coordinator)
    
    let viewModel = NicknameSettingViewModel(coordinator: coordinator)
    let viewController = makeViewController(
      storyboard: .ProfileSetting,
      viewController: NicknameSettingViewController.self
    ) as! NicknameSettingViewController
    
    coordinator.delegate = self
    viewController.setViewModel(viewModel)
    viewController.setNavigationTitle(with: "프로필 수정")
    self.push(viewController)
  }
}

extension SettingCoordinator: CoordinatorDelegate {
  @MainActor
  func coordinatorDidEnd(_ childCoordinator: Coordinator) {
    self.end()
    delegate?.coordinatorDidEnd(self)
  }
}
