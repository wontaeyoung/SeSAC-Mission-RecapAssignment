//
//  NaverAPIEndpoint.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Foundation

enum NaverAPIEndpoint: Endpoint {
  
  case shop(query: String, display: Int, start: Int, sort: Sort)
  case shopDetail(productID: String)
  
  var path: String {
    switch self {
      case .shop:
        return "/v1/search/shop.json"
        
      case .shopDetail(let productID):
        return "/product/\(productID)"
    }
  }
  
  var queryItems: [URLQueryItem] {
    switch self {
      case let .shop(query, display, start, sort):
        return [
          URLQueryItem(name: NaverAPIParameter.query.key, value: query),
          URLQueryItem(name: NaverAPIParameter.display.key, value: display.description),
          URLQueryItem(name: NaverAPIParameter.start.key, value: start.description),
          URLQueryItem(name: NaverAPIParameter.sort.key, value: sort.name)
        ]
        
      case .shopDetail:
        return []
    }
  }
}

extension NaverAPIEndpoint {
  
  enum Sort: String, CaseIterable{
    
    case sim, date, asc, dsc
    
    var name: String {
      return self.rawValue
    }
    
    var tag: Int {
      switch self {
        case .sim: return 0
        case .date: return 1
        case .asc: return 2
        case .dsc: return 3
      }
    }
    
    var title: String {
      switch self {
        case .sim:
          return "정확도"
          
        case .date:
          return "날짜순"
          
        case .asc:
          return "가격낮은순"
          
        case .dsc:
          return "가격높은순"
      }
    }
  }
}
