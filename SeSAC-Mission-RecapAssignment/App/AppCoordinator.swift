//
//  AppCoordinator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

final class AppCoordinator: Coordinator {
  
  weak var delegate: CoordinatorDelegate?
  weak var window: UIWindow?
  var childCoordinators: [Coordinator] = []
  
  init(window: UIWindow?) {
    self.window = window
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
    let rootNavigationController = UINavigationController()
    let authCoordinator = AuthCoordinator(rootNavigationController)
    rootNavigationController.delegate = UserNotificationManager.shared
    authCoordinator.delegate = self
    authCoordinator.start()
    self.addChild(authCoordinator)
    
    window?.rootViewController = rootNavigationController
    window?.makeKeyAndVisible()
  }
  
  @MainActor
  private func connectMainTabBarFlow() {
    let rootTabBarController = MainTabBarController()
    let mainTabBarCoordinator = MainTabBarCoordinator(tabBarController: rootTabBarController)
    mainTabBarCoordinator.delegate = self
    mainTabBarCoordinator.start()
    self.addChild(mainTabBarCoordinator)
    
    window?.rootViewController = rootTabBarController
    window?.makeKeyAndVisible()
  }
}

extension AppCoordinator: CoordinatorDelegate {
  
  @MainActor
  func coordinatorDidEnd(_ childCoordinator: Coordinator) {
    if User.default.onboarded {
      connectMainTabBarFlow()
    } else {
      connectOnboardingFlow()
    }
  }
}
