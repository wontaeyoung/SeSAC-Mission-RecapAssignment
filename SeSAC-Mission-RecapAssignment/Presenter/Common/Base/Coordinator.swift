//
//  Coordinator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

protocol CoordinatorDelegate: AnyObject {
  
  func coordinatorDidEnd(_ childCoordinator: Coordinator)
}

protocol Coordinator: AnyObject {
  // MARK: - Property
  var delegate: CoordinatorDelegate? { get set }
  var childCoordinators: [Coordinator] { get set }
  
  // MARK: - Method
  @MainActor func start()
  
}

protocol SubCoordinator: Coordinator {
  var navigationController: UINavigationController { get set }
  
  init(_ navigationController: UINavigationController)
  
  @MainActor func end()
  @MainActor func push(_ viewController: UIViewController, animation: Bool)
  @MainActor func pop(animation: Bool)
  @MainActor func popToRoot(animation: Bool)
  @MainActor func dismiss(animation: Bool)
  @MainActor func emptyOut()
  @MainActor func handle(error: Error)
  @MainActor func showAlert(
    title: String,
    message: String,
    okTitle: String?,
    okStyle: UIAlertAction.Style,
    isCancelable: Bool,
    completion: (() -> Void)?
  )
}

// MARK: - View Navigation
extension SubCoordinator {
  
  @MainActor
  func end() {
    self.emptyOut()
    self.delegate?.coordinatorDidEnd(self)
  }
  
  func push(_ viewController: UIViewController, animation: Bool = true) {
    self.navigationController.pushViewController(viewController, animated: animation)
  }
  
  func pop(animation: Bool = true) {
    self.navigationController.popViewController(animated: animation)
  }
  
  func popToRoot(animation: Bool = true) {
    self.navigationController.popToRootViewController(animated: animation)
  }
  
  func present(_ viewController: UIViewController, style: UIModalPresentationStyle = .automatic, animation: Bool = true) {
    viewController.modalPresentationStyle = style
    self.navigationController.present(viewController, animated: animation)
  }
  
  func dismiss(animation: Bool = true) {
    self.navigationController.dismiss(animated: animation)
  }
  
  func emptyOut() {
    self.navigationController.viewControllers.removeAll()
    self.childCoordinators.removeAll()
  }
  
  func handle(error: Error) {
    guard let raError = error as? RAError else {
      self.showErrorAlert(error: CoordinatorError.undefiendError)
      return
    }
    
    self.showErrorAlert(error: raError)
  }
  
  func showAlert(
    title: String,
    message: String,
    okTitle: String? = nil,
    okStyle: UIAlertAction.Style = .default,
    isCancelable: Bool = true,
    completion: (() -> Void)? = nil
  ) {
    var alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      .setAction(title: okTitle ?? "확인", style: okStyle, completion: completion)
      
    if isCancelable {
      alertController = alertController.setCancelAction()
    }
    
    self.present(alertController)
  }
  
  private func showErrorAlert(error: RAError) {
    let alertController = UIAlertController(
      title: error.alertDescription.title,
      message: error.alertDescription.message,
      preferredStyle: .alert
    )
      .setAction(title: "확인", style: .default)
    
    self.present(alertController)
  }
}

extension Coordinator {
  func makeViewController(storyboard: Constant.Storyboard, viewController: Navigatable.Type) -> UIViewController {
    let storyboard = UIStoryboard(name: storyboard.name, bundle: nil)
    
    return storyboard.instantiateViewController(withIdentifier: viewController.identifier)
  }
  
  func addChild(_ childCoordinator: Coordinator) {
    self.childCoordinators.append(childCoordinator)
  }
}
