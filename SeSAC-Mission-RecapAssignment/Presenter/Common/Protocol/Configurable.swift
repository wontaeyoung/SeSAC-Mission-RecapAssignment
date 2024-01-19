//
//  Configurable.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

// MARK: - Table Configurable
protocol TableCellRegister: UITableViewDelegate, UITableViewDataSource {
  func tableCellregister<T: BaseTableViewCell>(type: T.Type)
}

protocol TableConfigurable: TableCellRegister { 
  @MainActor func setDelegate(with tableView: UICollectionView)
}

extension TableConfigurable {
  func setDelegate(tableView: UITableView) {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

// MARK: - Collection Configurable
protocol CollectionCellRegister: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionCellRegister<T: BaseCollectionViewCell>(type: T.Type)
}

protocol CollectionConfigurable: CollectionCellRegister { 
  @MainActor func setDelegate(with collectionView: UICollectionView)
}

extension CollectionConfigurable {
  func setDelegate(collectionView: UICollectionView) {
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}
