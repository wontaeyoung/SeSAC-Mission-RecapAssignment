//
//  RAError.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

protocol RAError: Error {
  
  var logDescription: String { get }
  var alertDescription: (title: String, message: String) { get }
  func log(from function: String)
  func reThrow(from function: String) -> Self
}

extension RAError {
  
  func log(from function: String) {
    print("[에러 발생]", function, logDescription, separator: "\n")
  }
  
  func reThrow(from function: String) -> Self {
    log(from: function)
    return self
  }
}
