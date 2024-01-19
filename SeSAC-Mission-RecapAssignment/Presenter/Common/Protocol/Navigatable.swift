//
//  Navigation.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

protocol Navigatable: UIViewController {
  
  associatedtype Entity: RAModel
  
  static var identifier: String { get }
  
  func setData(data: Entity, bindAction: (() -> Void)?)
}
