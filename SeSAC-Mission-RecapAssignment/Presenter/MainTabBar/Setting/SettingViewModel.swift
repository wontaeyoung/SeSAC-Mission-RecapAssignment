//
//  SettingViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

final class SettingViewModel: ViewModel {
  weak var coordinator: SettingCoordinator?
  
  let settingItems: [String] = ["공지사항", "자주 묻는 질문", "1:1 문의", "알림 설정", "처음부터 시작하기"]
  
  init(coordinator: SettingCoordinator) {
    self.coordinator = coordinator
  }
  
  func showSettingViewController() {
    coordinator?.showSettingViewController()
  }
  
  func showNicknameSettingViewController() {
    coordinator?.showNicknameSettingViewController()
  }
  
  @MainActor
  func resetProfile() {
    User.default.resetProfile()
    coordinator?.end()
  }
  
  @MainActor
  func showResetAlert() {
    coordinator?.showAlert(
      title: "처음부터 시작하기",
      message: "데이터를 모두 초기화하시겠습니까?",
      okStyle: .destructive
    ) {
      self.resetProfile()
    }
  }
  
  @MainActor
  func showLikeCountInfoAlert() {
    coordinator?.showAlert(
      title: "좋아요 갯수 안내",
      message: "현재 관심 상품 갯수는 \(User.default.likes.count) 입니다.",
      isCancelable: false
    )
  }
}
