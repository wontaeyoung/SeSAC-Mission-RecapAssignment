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
      $0.numberOfLines = 3
    }
  }
  
  static func configureHintLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.caption.font
      $0.textColor = .red
      $0.textAlignment = .left
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
  
  // MARK: - ImageView
  static func configureProfileImageView(_ imageView: UIImageView) {
    
    imageView.isUserInteractionEnabled = true
    configureCircleShapeView(imageView)
  }
  
  static func configureSelectedImageView(_ imageView: UIImageView) {
    
    imageView.configure {
      $0.layer.borderColor = UIColor.accent.cgColor
      $0.layer.borderWidth = 4
    }
  }
  
  // MARK: - UIView
  static func configureCircleShapeView(_ view: UIView) {
    
    view.configure {
      $0.clipsToBounds = true
      $0.layer.cornerRadius = view.frame.size.width / 2
    }
  }
  
  // MARK: - TextField
  static func configureNicknameFeild(_ textField: UITextField) {
    
    textField.configure {
      let underline = CALayer().configured { layer in
        layer.backgroundColor = UIColor.raText.cgColor
        layer.frame = CGRect(x: 0, y: textField.frame.size.height - 1, width: textField.frame.size.width, height: 1)
      }
      
      $0.layer.addSublayer(underline)
      $0.textColor = .raText
      $0.backgroundColor = .clear
      $0.autocorrectionType = .no
      $0.autocapitalizationType = .none
      $0.setPlaceholderColor(.systemGray)
    }
  }
}
