//
//  UserNotificationManager.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/23/24.
//

import UIKit
import UserNotifications

final class UserNotificationManager: NSObject {
  
  static let shared = UserNotificationManager()
  
  private override init() {
    super.init()
    
    notiCenter.delegate = self
  }
  
  private let notiCenter: UNUserNotificationCenter = .current()
  private var currentViewController = UIViewController()
  
  func requestAuth(
    options: UNAuthorizationOptions = [.alert, .badge, .sound],
    completionHandler: @escaping (Bool, Error?) -> Void
  ) {
    notiCenter
      .requestAuthorization(options: options, completionHandler: completionHandler)
  }
  
  func registerUserNotification(id: String, title: String, body: String, trigger: Constant.Notification.Trigger) {
    
    let content = UNMutableNotificationContent().configured {
      $0.title = title
      $0.body = body
      $0.sound = .default
    }
    
    let request = UNNotificationRequest(
      identifier: id,
      content: content,
      trigger: trigger.trigger
    )
    
    /// ON
//    notiCenter.add(request)
    
    /// OFF
    notiCenter.removeAllPendingNotificationRequests()
  }
}

extension UserNotificationManager: UNUserNotificationCenterDelegate {
  /// 온보딩이 되지 않은 유저라면 알림을 보내지 않음
  /// 현재 유저가 보는 화면이 SettingViewController면 좋아요 갯수 안내 Alert
  /// 아니면 좋아요 유도 알림
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    /// 유저가 온보딩 완료가 아니면 바로 종료
    guard User.default.onboarded else {
      return
    }
    
    /// 지금 화면이 SettingViewController가 아니면 알림 표시
    guard currentViewController is SettingViewController else {
      completionHandler([.badge, .banner, .list, .sound])
      return
    }
    
    /// 지금 화면이 SettingViewController라면 좋아요 갯수 안내 알림
    (currentViewController as! SettingViewController)
      .presentLikesCountInfoAlert()
  }
}

/// 현재 유저가 보고있는 ViewController를 갱신하기 위한 Delegate
/// Appear 되는 ViewController를 currentViewController에 계속 갱신함
extension UserNotificationManager: UINavigationControllerDelegate {
  func navigationController(
    _ navigationController: UINavigationController,
    didShow viewController: UIViewController,
    animated: Bool
  ) {
    currentViewController = viewController
    print(String(describing: viewController))
  }
}
