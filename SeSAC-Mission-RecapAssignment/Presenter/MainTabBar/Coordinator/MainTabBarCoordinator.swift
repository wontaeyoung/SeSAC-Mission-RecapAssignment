//
//  MainTabBarCoordinator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class MainTabBarCoordinator: Coordinator {  
  
  // MARK: - Property
  weak var delegate: CoordinatorDelegate?
  var navigationController: UINavigationController
  lazy var tabBarController: UITabBarController = makeViewController(
    storyboard: .Main,
    viewController: MainTabBarController.self
  ) as! MainTabBarController
  var childCoordinators: [Coordinator]
  
  // MARK: - Intializer
  init(_ navigationController: UINavigationController) {
    self.navigationController = navigationController
    self.childCoordinators = []
  }
  
  // MARK: - Method
  func start() {
    /// 정의한 탭 페이지 갯수만큼 네비게이션 컨트롤러 생성
    /// 개별 Coordinator를 생성해서 탭 페이지마다의 네비게이션 플로우 적용
    /// 탭바 뷰컨트롤러 목록에 추가
    let rootNavigationControllers = MainTabBarPage.allCases.map { page in
      
      return UINavigationController().configured {
        $0.tabBarItem = page.tabBarItem
        connectTabFlow(page: page, controller: $0)
      }
    }
    
    tabBarController.viewControllers = rootNavigationControllers
  }
  
  @MainActor
  private func connectTabFlow(page: MainTabBarPage, controller: UINavigationController) {
    switch page {
      case .search:
        let searchCoordinator = SearchCoordinator(controller)
        searchCoordinator.start()
        self.addChind(searchCoordinator)
        
      case .setting:
        let settingCoordinator = SettingCoordinator(controller)
        settingCoordinator.delegate = self
        settingCoordinator.start()
        self.addChind(settingCoordinator)
    }
  }
}

extension MainTabBarCoordinator: CoordinatorDelegate {
  
  @MainActor
  func coordinatorDidEnd(_ childCoordinator: Coordinator) {
    self.popToRoot()
    self.end()
  }
}
