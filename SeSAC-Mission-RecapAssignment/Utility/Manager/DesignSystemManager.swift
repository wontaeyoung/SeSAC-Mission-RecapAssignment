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
  
  static func configureEmptyLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.plainBold.font
      $0.textColor = .raText
      $0.textAlignment = .center
    }
  }
  
  static func configureRecentSearchLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.plainBold.font
      $0.textColor = .raText
    }
  }
  
  static func configureSearchKeywordLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.plain.font
      $0.textColor = .raText
    }
  }
  
  static func configureResultCountLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.captionBold.font
      $0.textColor = .accent
    }
  }
  
  static func configureMallNameLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.caption.font
      $0.textColor = .gray
    }
  }
  
  static func configureProductTitleLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.caption.font
      $0.textColor = .raText
      $0.numberOfLines = 2
    }
  }
  
  static func configureProductPriceLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.plainBold.font
      $0.textColor = .raText
    }
  }
  
  static func configureNicknameLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.primaryTitle.font
      $0.textColor = .raText
    }
  }
  
  static func configureLikeCountLabel(_ label: UILabel) {
    
    label.configure {
      $0.font = RADesign.Font.captionBlack.font
      $0.textColor = .raText
    }
  }
  
  // MARK: - Button
  static func configurePrimaryButton(_ button: UIButton) {
    
    button.configure {
      $0.setTitleColor(.white, for: .normal)
      $0.titleLabel!.font = RADesign.Font.primaryTitle.font
      $0.backgroundColor = .accent
      $0.clipsToBounds = true
      $0.layer.cornerRadius = 8
    }
  }
  
  static func configureSortButton(_ button: UIButton, isSelected: Bool) {
    
    button.configure {
      $0.clipsToBounds = true
      $0.layer.borderColor = UIColor.raText.cgColor
      $0.layer.borderWidth = 1
      $0.layer.cornerRadius = 8
      
      configureSelectedSortButton(button, isSelected: isSelected)
    }
  }
  
  static func configureSelectedSortButton(_ button: UIButton, isSelected: Bool) {
    
    button.configure {
      $0.setTitleColor(isSelected ? .raBackground : .raText, for: .normal)
      $0.backgroundColor = isSelected ? .raText : .clear
      $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
  }
  
  static func configureLikeButton(_ button: UIButton) {
    
    button.configure {
      $0.tintColor = .raBackground
      $0.backgroundColor = .raText
      configureCircleShapeView($0, width: 30)
    }
  }
  
  // MARK: - ImageView
  static func configureProfileImageView(_ imageView: UIImageView) {
    
    imageView.isUserInteractionEnabled = true
    configureCircleShapeView(imageView, width: imageView.frame.size.width)
  }
  
  static func configureSelectedImageView(_ imageView: UIImageView) {
    
    imageView.configure {
      $0.layer.borderColor = UIColor.accent.cgColor
      $0.layer.borderWidth = 4
    }
  }
  
  static func configureProductImageView(_ imageView: UIImageView) {
    
    imageView.configure {
      $0.clipsToBounds = true
      $0.layer.cornerRadius = 15
      $0.contentMode = .scaleAspectFill
    }
  }
  
  // MARK: - UIView
  static func configureCircleShapeView(_ view: UIView, width: CGFloat) {
    
    view.configure {
      $0.clipsToBounds = true
      $0.layer.cornerRadius = width / 2
    }
  }
  
  // MARK: - TextField
  static func configureNicknameFeild(_ textField: UITextField) {
    
    textField.configure {
      let underline = CALayer().configured { layer in
        layer.backgroundColor = UIColor.raText.cgColor
        layer.frame = CGRect(x: 0, y: textField.frame.size.height - 10, width: textField.frame.size.width, height: 1)
      }
      
      $0.layer.addSublayer(underline)
      $0.borderStyle = .none
      $0.textColor = .raText
      $0.backgroundColor = .clear
      $0.autocorrectionType = .no
      $0.autocapitalizationType = .none
      $0.spellCheckingType = .no
    }
  }
  
  // MARK: - SearchBar
  static func configureSearchBar(_ searchBar: UISearchBar) {
    
    searchBar.configure {
      $0.barTintColor = .clear
      $0.tintColor = .accent
      $0.searchTextField.textColor = .raText
      $0.autocorrectionType = .no
      $0.autocapitalizationType = .none
      $0.spellCheckingType = .no
    }
  }
}
