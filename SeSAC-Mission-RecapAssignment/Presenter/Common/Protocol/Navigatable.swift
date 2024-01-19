//
//  Navigation.swift
//  TravelTalk
//
//  Created by 원태영 on 1/13/24.
//

import UIKit

protocol Navigatable: UIViewController {
  associatedtype Entity: RAModel
  
  static var identifier: String { get }
  
  func setData(data: Entity, bindAction: (() -> Void)?)
}
