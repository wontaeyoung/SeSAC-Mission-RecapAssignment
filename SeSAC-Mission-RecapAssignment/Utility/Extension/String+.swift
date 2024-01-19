//
//  String+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

extension String {
  
  static func combineWithLineBreaks(_ strings: String...) -> Self {
    return strings.joined(separator: "\n")
  }
}
