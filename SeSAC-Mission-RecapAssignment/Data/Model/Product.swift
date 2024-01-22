//
//  Product.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Foundation

struct Product: RAModel {
  
  let productID: String
  let title: String
  let mallName: String
  let lprice: Int
  let image: String
  
  var url: URL? {
    return URL(string: image)
  }
}
