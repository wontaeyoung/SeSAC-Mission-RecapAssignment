//
//  Configurable.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

// MARK: - Table Configurable
protocol TableCellRegister: UITableViewDelegate, UITableViewDataSource {
  
  func tableCellRegister<T: BaseTableViewCell>(
    _ tableView: UITableView,
    cellType: T.Type
  )
}

protocol TableConfigurable: TableCellRegister { 
  
  @MainActor func setTableViewConfiguration(_ tableView: UITableView)
}

extension TableConfigurable {
  
  func tableCellRegister<T: BaseTableViewCell>(
    _ tableView: UITableView,
    cellType: T.Type
  ) {
    let xib = UINib(nibName: T.identifier, bundle: nil)
    tableView.register(xib, forCellReuseIdentifier: T.identifier)
  }
  
  func setTableViewConfiguration(_ tableView: UITableView) {
    tableView.configure {
      $0.delegate = self
      $0.dataSource = self
      $0.backgroundColor = .clear
    }
  }
}

// MARK: - Collection Configurable
protocol CollectionCellRegister: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDataSourcePrefetching {
  
  func collectionCellRegister<T: BaseCollectionViewCell>(
    _ collectionView: UICollectionView,
    cellType: T.Type
  )
}

protocol CollectionConfigurable: CollectionCellRegister { 
  
  @MainActor func setCollectionViewConfiguration(_ collectionView: UICollectionView)
}

extension CollectionConfigurable {
  
  func collectionCellRegister<T: BaseCollectionViewCell>(
    _ collectionView: UICollectionView,
    cellType: T.Type
  ) {
    let xib = UINib(nibName: T.identifier, bundle: nil)
    collectionView.register(xib, forCellWithReuseIdentifier: T.identifier)
  }
  
  func setCollectionViewConfiguration(_ collectionView: UICollectionView) {
    collectionView.configure {
      $0.delegate = self
      $0.dataSource = self
      $0.prefetchDataSource = self
      $0.backgroundColor = .clear
    }
  }
}
