//
//  AppCoordinator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

final class AppCoordinator: Coordinator {
  
  weak var delegate: CoordinatorDelegate?
  var navigationController: UINavigationController
  var childCoordinators: [Coordinator]
  
  init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
    self.childCoordinators = []
  }
  
  func start() {
    if User.default.onboarded {
      
      connectMainTabBarFlow()
    } else {
     
      connectOnboardingFlow()
    }
  }
}

extension AppCoordinator {
  
  @MainActor 
  private func connectOnboardingFlow() {
    self.emptyOut()
    let authCoordinator = AuthCoordinator(self.navigationController)
    authCoordinator.delegate = self
    authCoordinator.start()
    self.addChind(authCoordinator)
  }
  
  private func connectMainTabBarFlow() {
    /// TabBarCoordinator 구현 후 작성
  }
}

extension AppCoordinator: CoordinatorDelegate {
  
  func coordinatorDidEnd(_ childCoordinator: Coordinator) {
    print(#function, "navigation stack", self.navigationController.viewControllers.count)
  }
}
