//
//  OnboardingViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

final class OnboardingViewController: BaseViewController, Navigatable, ViewModelController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var startButton: UIButton!
  
  /// 현재 프로젝트에서 스토리보드 기반 뷰컨트롤러 인스턴스 생성 메커니즘을 사용하기 때문에, init(coder:)로 컨트롤러 인스턴스가 초기화되고 있다.
  /// viewModel을 초기화 파라미터로 받아서 주입해야하는데, init(coder:)는 추가 파라미터를 받을 수 없다.
  /// viewModel을 옵셔널로 선언하고 Coordinator에서 직접 할당하는 방법으로 결정!
  /// ViewModel - View 1:1 대응인데 ViewModel 인스턴스를 ViewController 이니셜라이저에서 초기화하면 안되나?
  private var viewModel: OnboardingViewModel?
  
  override func configure() {
    DesignSystemManager.configureOnboardingTitleLabel(titleLabel)
    DesignSystemManager.configurePrimaryButton(startButton)
  }
  
  override func setAttribute() {
    navigationItem.backButtonTitle = ""
    titleLabel.text = .combineWithLineBreaks("SeSAC", "Shopping")
    imageView.image = .onboarding
    startButton.setTitle("시작하기", for: .normal)
    startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
  }
  
  func setViewModel(_ viewModel: OnboardingViewModel) {
    self.viewModel = viewModel
  }
}

extension OnboardingViewController {
  
  @objc private func startButtonTapped(_ sender: UIButton) {
    viewModel?.showNicknameSettingViewController()
  }
}
