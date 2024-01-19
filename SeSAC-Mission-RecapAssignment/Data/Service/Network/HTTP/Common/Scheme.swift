//
//  Scheme.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

enum Scheme: String {
  
  case http
  case https
  
  var name: String {
    self.rawValue
  }
}

