//
//  Constant.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import UIKit

enum Constant {
  
  enum Network {
    static var requestTimeLimit: Double { return 10 }
    static var resourceTimeLimit: Double { return 15 }
  }
  
  enum Storyboard: String {
    case Onboarding
    case ProfileSetting
    case Search
    case Setting
    
    var name: String {
      return self.rawValue
    }
  }
  
  enum Notification {
    
    enum Identifier {
      static var likeMoreProduct: String { return "likeMoreProduct" }
    }
    
    enum Trigger {
      case time(interval: TimeInterval, repeats: Bool)
      case date(repeats: Bool, year: Int? = nil, month: Int? = nil, day: Int? = nil,
                hour: Int? = nil, minute: Int? = nil, second: Int? = nil)
      
      var trigger: UNNotificationTrigger {
        switch self {
          case let .time(interval, repeats):
            return UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: repeats)
            
          case let .date(repeats, year, month, day, hour, minute, second):
            let dateComponent = DateComponents().configured {
              $0.year = year
              $0.month = month
              $0.day = day
              $0.hour = hour
              $0.minute = minute
              $0.second = second
            }
            
            return UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: repeats)
        }
      }
    }
  }
}
