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
  init(_ navigationController: UINavigationController)
  
  // MARK: - Method
  @MainActor func start()
  @MainActor func end()
  @MainActor func push(_ viewController: BaseViewController, animation: Bool)
  @MainActor func pop()
  @MainActor func dismiss()
  @MainActor func emptyOut()
  @MainActor func makeViewController(storyboard: Constant.Storyboard, viewController: Navigatable.Type) -> BaseViewController
  @MainActor func handle(error: Error)
  @MainActor func showAlert(
    title: String,
    message: String,
    okTitle: String?,
    completion: (() -> Void)?
  )
}

extension Coordinator {
  
  func end() {
    self.childCoordinators.removeAll()
    self.delegate?.coordinatorDidEnd(self)
  }
  
  func push(_ viewController: BaseViewController, animation: Bool = true) {
    self.navigationController.pushViewController(viewController, animated: animation)
  }
  
  func pop() {
    self.navigationController.popViewController(animated: true)
  }
  
  func present(_ viewController: UIViewController, style: UIModalPresentationStyle = .automatic) {
    viewController.modalPresentationStyle = style
    self.navigationController.present(viewController, animated: true)
  }
  
  func dismiss() {
    self.navigationController.dismiss(animated: true)
  }
  
  func emptyOut() {
    self.navigationController.popToRootViewController(animated: true)
  }
  
  func makeViewController(storyboard: Constant.Storyboard, viewController: Navigatable.Type) -> BaseViewController {
    let storyboard = UIStoryboard(name: storyboard.name, bundle: nil)
    
    return storyboard.instantiateViewController(withIdentifier: viewController.identifier) as! BaseViewController
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
    completion: (() -> Void)? = nil
  ) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      .setAction(title: okTitle ?? "확인", completion: completion)
      .setCancelAction()
    
    self.present(alertController)
  }
}

extension Coordinator {
  
  private func showErrorAlert(error: RAError) {
    let alertController = UIAlertController(
      title: error.alertDescription.title,
      message: error.alertDescription.message,
      preferredStyle: .alert
    )
      .setAction(title: "확인")
    
    self.present(alertController)
  }
}
