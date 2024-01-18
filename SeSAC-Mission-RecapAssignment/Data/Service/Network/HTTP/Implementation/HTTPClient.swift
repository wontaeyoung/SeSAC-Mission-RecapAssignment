//
//  HTTPClient.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

import Alamofire
import Foundation

final class HTTPClient {
  static let shared: HTTPClient = HTTPClient()
  
  private init() { }
  
  private let configuration: URLSessionConfiguration = .default.configured {
    $0.timeoutIntervalForRequest = Constant.Network.requestTimeLimit
    $0.timeoutIntervalForResource = Constant.Network.resourceTimeLimit
  }
  
  private lazy var session = Session(configuration: configuration)
  
  func callRequest<T: Codable>(
    _ apiRequest: APIRequest,
    headers: HTTPHeaders,
    method: HTTPMethod,
    completion: @escaping (Result<T, AFError>) -> Void
  ) throws {
    
    guard let url = apiRequest.components.url else {
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
}
