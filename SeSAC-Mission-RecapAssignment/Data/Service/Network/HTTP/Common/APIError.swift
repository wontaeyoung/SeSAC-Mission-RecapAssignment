//
//  APIError.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

enum APIError: RAError {
  
  case convertURLFailed
  case timedOut // timeoutIntervalForRequest or timeoutIntervalForResource
  case networkConnectionLost // 요청 시작 후에 사용자 인터넷 연결이 끊어졌을 때
  case notConnectedToInternet // 사용자가 인터넷에 연결되어있지 않을 때
  case unknownError
  
  var logDescription: String {
    
    switch self {
      case .convertURLFailed:
        return "URL 변환 실패"
        
      case .timedOut:
        return "요청 시간 초과"
        
      case .networkConnectionLost:
        return "사용자 네트워크 연결 끊어짐"
        
      case .notConnectedToInternet:
        return "사용자 인터넷 연결 없음"
        
      case .unknownError:
        return "정의되지 않은 오류 발생"
    }
  }
  
  var alertDescription: (title: String, message: String) {
    
    switch self {
      case .convertURLFailed:
        return (title: "네트워크 요청에 실패했어요.",
                message: "잠시 후에 다시 시도해주세요!")
        
      case .timedOut:
        return (title: "서버 응답을 받지 못했습니다.",
                message: .combineWithLineBreaks("요청 시간이 초과되었어요.", "네트워크 상태를 확인해주세요.", "문제가 계속 되면 잠시 후 다시 시도해주세요!"))
        
      case .networkConnectionLost:
        return (title: "네트워크 연결이 끊어졌어요.",
                message: "네트워크 상태를 확인하고 다시 시도해주세요!")
        
      case .notConnectedToInternet:
        return (title: "인터넷에 연결되어있지 않습니다.",
                message: "와이파이를 확인해주세요!")
        
      case .unknownError:
        return (title: "알 수 없는 오류가 발생했어요.",
                message: "문제가 계속 되면 잠시 후 다시 시도해주세요!")
    }
  }
}
