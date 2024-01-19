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
  var navigationController: UINavigationController { get set }
  var childCoordinators: [Coordinator] { get set }
  
  // MARK: - Initializer
  init(_ navigationController: UINavigationController, childCoordinators: [Coordinator])
  
  // MARK: - Method
  @MainActor func start()
  @MainActor func end()
  @MainActor func push(_ viewController: BaseViewController)
  @MainActor func pop()
  @MainActor func dismiss()
  @MainActor func emptyOut()
  @MainActor func handle(error: Error)
  @MainActor func showAlert(title: String, message: String, ok: (title: String, style: UIAlertAction.Style), cancelTitle: String, action: @escaping () -> Void)
}

extension Coordinator {
  
  func end() {
    self.childCoordinators.removeAll()
    self.delegate?.coordinatorDidEnd(self)
  }
  
  @MainActor
  func push(_ viewController: BaseViewController) {
    self.navigationController.pushViewController(viewController, animated: true)
  }
  
  @MainActor
  func pop() {
    self.navigationController.popViewController(animated: true)
  }
  
  func present(_ viewController: UIViewController, style: UIModalPresentationStyle = .automatic) {
    viewController.modalPresentationStyle = style
    self.navigationController.present(viewController, animated: true)
  }
  
  @MainActor
  func dismiss() {
    self.navigationController.dismiss(animated: true)
  }
  
  @MainActor
  func emptyOut() {
    self.navigationController.popToRootViewController(animated: true)
  }
  
  @MainActor func handle(error: Error) {
    guard let raError = error as? RAError else {
      self.showErrorAlert(error: CoordinatorError.undefiendError)
      return
    }
    
    self.showErrorAlert(error: raError)
  }
}

extension Coordinator {
  
  @MainActor
  private func showErrorAlert(error: RAError) {
    let alertController = UIAlertController(
      title: error.alertDescription.title,
      message: error.alertDescription.message,
      preferredStyle: .alert
    )
      .setAction(title: "확인")
    
    self.present(alertController)
  }
  
  @MainActor
  func showAlert(
    title: String,
    message: String,
    okTitle: String? = nil,
    completion: (() -> Void)? = nil
  ) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      .setAction(title: okTitle ?? "확인", completion: completion)
      .setCancelAction()
    
    self.present(alertController)
  }
}
