//
//  APIRequest.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Foundation

struct APIRequest {
  
  let scheme: Scheme
  let host: Host
  let endpoint: Endpoint
  
  var components: URLComponents {
    return URLComponents().configured {
      $0.scheme = scheme.rawValue
      $0.host = host.domain
      $0.path = endpoint.path
      $0.queryItems = endpoint.queryItems
    }
  }
}
