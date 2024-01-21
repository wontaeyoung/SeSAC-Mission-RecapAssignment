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
  
  @MainActor
  private func connectMainTabBarFlow() {
    self.popToRoot()
    let mainTabBarCoordinator = MainTabBarCoordinator(self.navigationController)
    mainTabBarCoordinator.delegate = self
    mainTabBarCoordinator.start()
    self.addChind(mainTabBarCoordinator)
  }
}

extension AppCoordinator: CoordinatorDelegate {
  
  @MainActor
  func coordinatorDidEnd(_ childCoordinator: Coordinator) {
    print("App 코디네이터 : 온보딩 \(User.default.onboarded)")
    
    if User.default.onboarded {
      connectMainTabBarFlow()
    } else {
      connectOnboardingFlow()
    }
  }
}
