//
//  NicknameSettingViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/20/24.
//

final class NicknameSettingViewModel: ViewModel {
  weak var coordinator: AuthCoordinator?
  
  lazy var inputNickname: Observable<String> = Observable("").binded { [weak self] newNickname in
    guard let self else { return }
    
    let validation = validateNickname(newNickname)
    outputHintText.set(validation.hintText)
    outputValidation.set(validation == .satisfied)
  }
  
  var outputHintText: Observable<String> = Observable("")
  var outputValidation: Observable<Bool> = Observable(false)
  
  init(coordinator: AuthCoordinator) {
    self.coordinator = coordinator
  }
  
  func showProfileImageSttingViewController() {
    coordinator?.showProfileImageSttingViewController()
  }
  
  @MainActor
  func connectMainTabBarFlow() {
    coordinator?.end()
  }
  
  func applyNickname(_ text: String) {
    User.default.nickname = text
  }
  
  @MainActor
  func switchView() {
    if User.default.onboarded {
      coordinator?.pop()
    } else {
      onboardingCompleted()
    }
  }
  
  @MainActor
  private func onboardingCompleted() {
    User.default.onboarded = true
    
    connectMainTabBarFlow()
  }
  
  func updateProfile(_ text: String) {
    User.default.nickname = text
  }
}

// MARK: - 닉네임 유효성
extension NicknameSettingViewModel {
  
  func validateNickname(_ nickname: String) -> NicknameValidation {
    for validation in NicknameValidation.allCases {
      if matchRegExp(nickname, validation: validation) { return validation }
    }
    
    return .satisfied
  }
  
  private func matchRegExp(_ nickname: String, validation: NicknameValidation) -> Bool {
    let isMathed: Bool = nickname.range(
      of: validation.regExpPattern,
      options: .regularExpression) != nil
    
    return isMathed
  }
  
  enum NicknameValidation: String, CaseIterable {
    case empty = ""
    case containsSpecialCharacter = "닉네임에 @, #, $, % 는 포함할 수 없어요."
    case containsNumber = "닉네임에 숫자는 포함할 수 없어요."
    case lengthUnsatisfied = "2글자 이상 10글자 미만으로 설정해주세요."
    case satisfied = "사용할 수 있는 닉네임이에요."
    
    var hintText: String {
      return self.rawValue
    }
    
    var regExpPattern: String {
      switch self {
        case .empty:
          return #"^$"#
          
        case .containsSpecialCharacter:
          return #"[@$%#]"#
        
        case .containsNumber:
          return #"\d+"#
          
        case .lengthUnsatisfied:
          return #"^(.{0,1}|.{10,})$"#
          
        default:
          return ""
      }
    }
  }
}
