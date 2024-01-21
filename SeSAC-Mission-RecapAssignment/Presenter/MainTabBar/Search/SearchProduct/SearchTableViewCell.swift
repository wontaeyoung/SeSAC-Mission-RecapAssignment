//
//  SearchTableViewCell.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class SearchTableViewCell: BaseTableViewCell {

  @IBOutlet weak var searchIconImageView: UIImageView!
  @IBOutlet weak var searchKeywordLabel: UILabel!
  @IBOutlet weak var deleteButton: UIButton!
  
  var deleteRowAction: (() -> Void)?
  
  override func configure() {
    searchIconImageView.tintColor = .raText
    DesignSystemManager.configureSearchKeywordLabel(searchKeywordLabel)
    deleteButton.tintColor = .gray
  }
  
  override func setAttribute() {
    searchIconImageView.image = RADesign.Image.search.image
    deleteButton.setImage(RADesign.Image.delete.image, for: .normal)
    deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
  }
  
  func setData(text: String, tag: Int, completion: @escaping () -> Void) {
    searchKeywordLabel.text = text
    deleteButton.tag = tag
    deleteRowAction = completion
  }
  
  @objc private func deleteButtonTapped(_ sender: UIButton) {
    User.default.recentSearches.remove(at: sender.tag)
    deleteRowAction?()
  }
}
