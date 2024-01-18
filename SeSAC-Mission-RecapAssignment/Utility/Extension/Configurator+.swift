//
//  Configurator.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//
import UIKit

protocol Configurator {}

extension Configurator where Self: Any {
  func configure(_ apply: (inout Self) -> Void) -> Self {
    var configurableSelf = self
    apply(&configurableSelf)
    
    return configurableSelf
  }
}

extension Configurator where Self: AnyObject {
  func configure(_ apply: (Self) -> Self) -> Self{
    return apply(self)
  }
}

extension NSObject: Configurator {}
extension Array: Configurator {}
extension Dictionary: Configurator {}
extension Set: Configurator {}
