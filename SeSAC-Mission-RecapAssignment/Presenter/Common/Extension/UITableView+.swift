//
//  UITableView+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

extension UITableView {
  
  func dequeueCell<T: BaseTableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
  }
}
