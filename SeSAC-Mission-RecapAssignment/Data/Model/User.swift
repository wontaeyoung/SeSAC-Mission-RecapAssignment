//
//  User.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

/// 싱글톤 -> 구조체 vs 클래스
/// 구조체는 프로퍼티를 변경할 때 Mutating이 필요하지만 변수가 모두 UserDefault 래퍼로 수정되기 때문에 이 부분은 고려하지 않아도 됨
/// 구조체는 원래 멀티 스레드 접근에 대해 안전하지만, 싱글톤은 값 복사가 일어나지 않고 전역에 선언된 하나의 인스턴스에 접근하는 것이기 때문에 클래스와 동일하게 멀티스레드 문제를 가지고 있음
/// 싱글톤은 앱 전역에서 하나의 인스턴스를 두고 데이터 일관성을 유지하는 것이 장점인데, 싱글톤 구조체 인스턴스를 실수로 다른 변수에 할당해서 변경할 때는 값 복사가 일어나서 데이터 일관성이 깨지게 됨
/// 다른 변수에 싱글톤 인스턴스를 할당하는 것은 제어할 수 없기 때문에, 이러한 부분을 고려하여 클래스로 하는 것이 맞을 것 같음
final class User {
  
  static let `default` = User()
  
  private init() { }
  
  /// 닉네임 & 프로필 검사로 결정하면 유저가 선택한 프로필인지 defaultValue 때문에 결정된 프로필인지 식별이 불가함
  /// [처음부터 시작하기]를 트리거로 상태값을 가지고 관리하는게 나을 듯
  @UserDefault(key: .onboard, defaultValue: false)
  var onboarded: Bool
  
  @UserDefault(key: .nickname, defaultValue: "")
  var nickname: String
  
  @UserDefault(key: .profile, defaultValue: .allCases.randomElement() ?? .profile1)
  var profile: Profile
  
  @UserDefault(key: .likes, defaultValue: [])
  var likes: [String]
  
  @UserDefault(key: .recentSearches, defaultValue: [])
  var recentSearches: [String]
  
  func addNewSearchKeyword(_ keyword: String) {
    if let index = recentSearches.firstIndex(of: keyword) {
      recentSearches.remove(at: index)
    }
    
    recentSearches.insert(keyword, at: 0)
  }
  
  func toggleLike(productID: String) {
    let isContains: Bool = User.default.likes.contains(productID)
    
    if isContains {
      if let index = likes.firstIndex(of: productID) {
        likes.remove(at: index)
      }
    } else {
      likes.append(productID)
    }
  }
  
  func resetProfile() {
    nickname = ""
    profile = .allCases.randomElement() ?? .profile1
    likes.removeAll()
    recentSearches.removeAll()
    onboarded = false
  }
}
