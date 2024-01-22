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

struct ProductDTO: Codable, RADTO {
  
  let productID: String
  let title: String
  let mallName: String
  let lprice: String
  let image: String
  
  enum CodingKeys: String, CodingKey {
    case title, image, lprice, mallName
    case productID = "productId"
  }
  
  var asModel: Product {
    return Product(
      productID: productID,
      title: title,
      mallName: mallName,
      lprice: Int(lprice) ?? 0,
      image: image
    )
  }
}
