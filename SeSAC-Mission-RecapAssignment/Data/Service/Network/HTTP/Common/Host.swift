//
//  Host.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

enum Host: String {
  
  case naverOpenAPI = "openapi.naver.com"
  case naverShopProductDetail = "msearch.shopping.naver.com"
  
  var domain: String {
    return self.rawValue
  }
}
