//
//  NaverAPIEndpoint.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Foundation

enum NaverAPIEndpoint: Endpoint {
  case shop(query: String, display: Int, start: Int, sort: Sort)
  
  var path: String {
    return "/v1/search/shop.json"
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
    }
  }
}

extension NaverAPIEndpoint {
  enum Sort: String {
    case sim, date, asc, dsc
    
    var name: String { return self.rawValue }
  }
}
