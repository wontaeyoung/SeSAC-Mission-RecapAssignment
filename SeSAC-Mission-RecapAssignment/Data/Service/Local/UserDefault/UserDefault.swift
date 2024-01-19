//
//  UserDefault.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Foundation

@propertyWrapper
struct UserDefault<T: Codable> {
  
  private let key: Key
  private let defaultValue: T
  private let userDefault: UserDefaults
  
  init(
    key: Key,
    defaultValue: T,
    userDefault: UserDefaults = .standard
  ) {
    self.key = key
    self.defaultValue = defaultValue
    self.userDefault = userDefault
  }
  
  var wrappedValue: T {
    get {
      guard 
        let data = userDefault.data(forKey: key.name),
        let value = try? JsonCoder.decoder.decode(T.self, from: data)
      else {
        return defaultValue
      }
      
      return value
    }
    set {
      let data: Data? = try? JsonCoder.encoder.encode(newValue)
      
      UserDefaults.standard.setValue(data, forKey: key.name)
    }
  }
}

extension UserDefault {
  
  enum Key: String {
    
    case onboard
    case nickname
    case profile
    case likes
    case recentSearches
    
    var name: String {
      return self.rawValue
    }
  }
}
