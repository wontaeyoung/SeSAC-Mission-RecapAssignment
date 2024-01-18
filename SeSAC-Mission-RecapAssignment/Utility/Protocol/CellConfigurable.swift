//
//  CellConfigurable.swift
//  TravelTalk
//
//  Created by 원태영 on 1/12/24.
//

import UIKit

protocol CellConfigurable: UITableViewCell {
  static var identifier: String { get }
  
  func configureCell()
}

protocol CellDataSettable: CellConfigurable {
  associatedtype Entity: RAModel
  
  func setData(data: Entity, tag: Int)
}
