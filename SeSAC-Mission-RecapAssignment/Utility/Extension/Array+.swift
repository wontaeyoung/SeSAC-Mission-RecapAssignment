//
//  Array+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

extension Array {
  
  func element(at index: Int) -> Element? {
    guard index < self.count else {
      return nil
    }
    
    return self[index]
  }
}
