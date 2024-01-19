//
//  DesignSystemManager.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

final class DesignSystemManager {
  
  // MARK: - Label
  static func configureOnboardingTitleLabel(_ label: UILabel) {
    label.configure {
      $0.font = RADesign.Font.onboardingTitle.font
      $0.textColor = .accent
      $0.textAlignment = .center
      $0.numberOfLines = 2
    }
  }
  
  // MARK: - Button
  static func configurePrimaryButton(_ button: UIButton) {
    button.configure {
      $0.setTitleColor(.white, for: .normal)
      $0.titleLabel!.font = RADesign.Font.primaryButtonTitle.font
      $0.backgroundColor = .accent
      $0.clipsToBounds = true
      $0.layer.cornerRadius = 8
    }
  }
}
