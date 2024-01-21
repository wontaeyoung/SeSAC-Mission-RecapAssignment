//
//  SearchCoordinator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class SearchCoordinator: Coordinator {
  
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
    showSearchViewController()
  }
  
  private func configureNavigationBar() {
    navigationController.navigationBar.configure {
      $0.tintColor = .raText
      $0.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.raText]
    }
  }
}

extension SearchCoordinator {
  
  func showSearchViewController() {
    let viewModel = SearchViewModel(coordinator: self)
    let viewController = makeViewController(
      storyboard: .Search,
      viewController: SearchViewController.self
    ) as! SearchViewController
    
    viewController.setViewModel(viewModel)
    self.push(viewController, animation: false)
  }
}
