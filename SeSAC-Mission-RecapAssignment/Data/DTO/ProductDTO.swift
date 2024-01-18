//
//  ProductDTO.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

struct ResponseDTO: Codable {
  let total: Int
  let start: Int
  let display: Int
  let items: [ProductDTO]
}

struct ProductDTO: Codable, DTO {
  let productID: String
  let title: String
  let mallName: String
  let lprice: Int
  let image: String
  
  var asModel: RAModel {
    return Product(
      productID: productID,
      title: title,
      mallName: mallName,
      lprice: lprice,
      image: image
    )
  }
}
