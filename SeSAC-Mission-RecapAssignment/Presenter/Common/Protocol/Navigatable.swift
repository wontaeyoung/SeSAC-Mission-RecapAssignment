//
//  Navigation.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

protocol Navigatable: UIViewController {
  
  static var identifier: String { get }
}
