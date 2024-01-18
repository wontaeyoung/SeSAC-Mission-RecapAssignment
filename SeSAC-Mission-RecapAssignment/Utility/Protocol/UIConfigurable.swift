//
//  UIConfigurable.swift
//  TravelTalk
//
//  Created by 원태영 on 1/12/24.
//

import UIKit

protocol UIConfigurable: UIViewController {
  func configureUI()
}

protocol Registerable: UIConfigurable {
  func register<T: CellConfigurable>(cellType: T.Type)
}
protocol TableUIConfigurable: Registerable {
  func configureTableView()
}

protocol CollectionUIConfigurable: Registerable {
  func configureCollectionView()
}
