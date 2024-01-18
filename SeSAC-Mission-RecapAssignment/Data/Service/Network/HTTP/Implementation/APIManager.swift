//
//  APIManager.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Alamofire
import Foundation

final class APIManager {
  static let shared: APIManager = APIManager()
  
  private init() { }
  
  private let configuration: URLSessionConfiguration = .default.configured {
    $0.timeoutIntervalForRequest = 10
    $0.timeoutIntervalForResource = 15
  }
  
  private lazy var session = Session(configuration: configuration)
  
  func callRequest<T: Codable>(
    _ request: APIRequest,
    headers: HTTPHeaders,
    method: HTTPMethod,
    completion: @escaping (Result<T, AFError>) -> Void
  ) throws {
    
    guard let url = components(with: request).url else {
      throw APIError.convertURLFailed.reThrow(from: #function)
    }
    
    session
      .request(url, method: method, headers: headers)
      .responseDecodable(of: T.self) { response in
        switch response.result {
          case .success(let data):
            completion(.success(data))
            
          case .failure(let error):
            completion(.failure(error))
        }
      }
  }
  
  
  private func components(with apiRequest: APIRequest) -> URLComponents {
    return URLComponents().configured {
      $0.scheme = apiRequest.scheme.rawValue
      $0.host = apiRequest.host.domain
      $0.path = apiRequest.endpoint.path
      $0.queryItems = apiRequest.endpoint.queryItems
    }
  }
}
