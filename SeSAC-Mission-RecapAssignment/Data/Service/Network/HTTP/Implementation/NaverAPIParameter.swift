//
//  NaverAPIParameter.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Foundation

enum NaverAPIParameter: String {
  
  case query
  case display
  case start
  case sort
  
  var key: String { return self.rawValue }
}
