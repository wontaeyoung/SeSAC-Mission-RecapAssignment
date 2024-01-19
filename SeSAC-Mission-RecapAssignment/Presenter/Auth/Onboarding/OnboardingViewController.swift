//
//  OnboardingViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

final class OnboardingViewController: BaseViewController, Navigatable {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var startButton: UIButton!
  
  override func setUI() {
    DesignSystemManager.configureOnboardingTitleLabel(titleLabel)
    DesignSystemManager.configurePrimaryButton(startButton)
  }
  
  override func setAttribute() {
    titleLabel.text = .combineWithLineBreaks("SeSAC", "Shopping")
    imageView.image = .onboarding
    startButton.setTitle("시작하기", for: .normal)
  }
}

extension OnboardingViewController {
  @objc private func startButtonTapped() {
    
  }
}
