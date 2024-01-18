//
//  ProductDTO.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Foundation

// MARK: - Temperatures
struct ResponseDTO: Codable {
  let total: Int
  let start: Int
  let display: Int
  let items: [ProductDTO]
}

// MARK: - Item
struct ProductDTO: Codable {
  let title: String
  let image: String
  let lprice: Int
  let mallName: String
  let productID: String
}
