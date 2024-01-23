//
//  SearchCoordinator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class SearchCoordinator: SubCoordinator {
  
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
    UserNotificationManager.shared.registerUserNotification(
      id: Constant.Notification.Identifier.likeMoreProduct,
      title: "좋아요 격려 알림",
      body: "좋아요를 추가로 눌러보세요!",
      trigger: .time(interval: 60, repeats: true)
    )
    
    configureNavigationBar()
    showSearchViewController()
  }
  
  private func configureNavigationBar() {
    navigationController.navigationBar.configure {
      $0.tintColor = .raText
      $0.barTintColor = .raBackground
      $0.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.raText]
    }
  }
}

extension SearchCoordinator {
  
  func showDeleteAllAlert(completion: @escaping () -> Void) {
    self.showAlert(
      title: "최근 검색어 삭제",
      message: "최근 검색어를 모두 삭제할까요?", 
      okTitle: "삭제",
      okStyle: .destructive,
      completion: completion
    )
  }
  
  func showSearchViewController() {
    let viewModel = SearchViewModel(coordinator: self)
    let viewController = makeViewController(
      storyboard: .Search,
      viewController: SearchViewController.self
    ) as! SearchViewController
    
    viewController.setViewModel(viewModel)
    self.push(viewController, animation: false)
  }
  
  func showSearchResultViewController(keyword: String) {
    let viewModel = SearchResultViewModel(coordinator: self)
    let viewController = makeViewController(
      storyboard: .Search,
      viewController: SearchResultViewController.self
    ) as! SearchResultViewController
    
    viewController.setViewModel(viewModel)
    viewController.setData(keyword: keyword)
    self.push(viewController)
  }
  
  func showProductDetailViewController(product: Product) {
    let viewController = makeViewController(
      storyboard: .Search,
      viewController: ProductDetailViewController.self
    ) as! ProductDetailViewController
    
    viewController.setData(product: product)
    self.push(viewController)
  }
}
