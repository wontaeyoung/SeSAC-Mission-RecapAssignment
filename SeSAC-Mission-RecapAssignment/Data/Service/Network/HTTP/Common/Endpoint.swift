//
//  Protocol.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Foundation

protocol Endpoint {
  
  var path: String { get }
  var queryItems: [URLQueryItem] { get }
}
