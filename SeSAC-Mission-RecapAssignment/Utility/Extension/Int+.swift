//
//  Int+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

import Foundation

extension Int {
  var formatted: String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal

    return numberFormatter.string(for: self)!
  }
}
