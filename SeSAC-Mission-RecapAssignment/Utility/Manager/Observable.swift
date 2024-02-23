//
//  Observable.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 2/23/24.
//

final class Observable<T> {
  
  // MARK: - Property
  private var value: T {
    didSet {
      closure?(value)
    }
  }
  
  private var closure: ((T) -> Void)?

  var current: T {
    return value
  }

  // MARK: - Initializer
  init(_ value: T) {
    self.value = value
  }
  
  func bind(_ closure: @escaping (T) -> Void) {
    closure(value)
    self.closure = closure
  }
  
  func binded(_ closure: @escaping (T) -> Void) -> Observable {
    self.bind(closure)
    return self
  }
  
  func set(_ value: T) {
    self.value = value
  }
}
