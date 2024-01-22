//
//  SceneDelegate.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  var coordinator: AppCoordinator?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    window?.overrideUserInterfaceStyle = .dark
    
    self.coordinator = AppCoordinator(window: window)
    self.coordinator?.start()
  }
  
  func sceneDidDisconnect(_ scene: UIScene) {
    
  }
  
  func sceneDidBecomeActive(_ scene: UIScene) {
    
  }
  
  func sceneWillResignActive(_ scene: UIScene) {
    
  }
  
  func sceneWillEnterForeground(_ scene: UIScene) {
    
  }
  
  func sceneDidEnterBackground(_ scene: UIScene) {
    
  }
}

