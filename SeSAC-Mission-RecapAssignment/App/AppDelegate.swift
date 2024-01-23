//
//  AppDelegate.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  private func setGlobalAppearence() {
    let appearence = UINavigationBarAppearance().configured {
      $0.backgroundColor = .raBackground
      $0.titleTextAttributes = [.foregroundColor: UIColor.raText]
      $0.largeTitleTextAttributes = [.foregroundColor: UIColor.raText]
    }
    
    UINavigationBar.appearance().standardAppearance = appearence
    UINavigationBar.appearance().compactAppearance = appearence
    UINavigationBar.appearance().scrollEdgeAppearance = appearence
  }
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setGlobalAppearence()
    
    UserNotificationManager.shared.requestAuth { isSuccess, error in
      print(#function, "알림 권한 허용 여부 :", isSuccess)
    }
    
    return true
  }
  
  // MARK: UISceneSession Lifecycle
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    
  }
}

