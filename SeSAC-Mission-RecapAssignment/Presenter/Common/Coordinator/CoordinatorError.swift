//
//  CoordinatorError.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

enum CoordinatorError: RAError {
  case undefiendError
  
  var logDescription: String {
    switch self {
      case .undefiendError:
        return "정의되지 않은 오류 발생"
    }
  }
  
  var alertDescription: (title: String, message: String) {
    return (title: "알 수 없는 오류가 발생했어요.",
            message: "문제가 계속 되면 잠시 후 다시 시도해주세요!")
  }
}
