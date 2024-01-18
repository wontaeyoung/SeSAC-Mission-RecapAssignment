//
//  APIError.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

enum APIError: RAError {
  case convertURLFailed
  
  var logDescription: String {
    switch self {
      case .convertURLFailed:
        return "URL 변환에 실패했습니다."
    }
  }
  
  var alertDescription: String {
    switch self {
      case .convertURLFailed:
        return "네트워크 요청에 실패했어요. 잠시 후에 다시 시도해주세요!"
    }
  }
}
