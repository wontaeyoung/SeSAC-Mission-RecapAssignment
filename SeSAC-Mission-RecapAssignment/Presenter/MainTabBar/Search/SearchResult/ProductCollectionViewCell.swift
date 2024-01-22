//
//  ProductCollectionViewCell.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

import UIKit
import Kingfisher

final class ProductCollectionViewCell: BaseCollectionViewCell {
  
  @IBOutlet weak var productImageView: UIImageView!
  @IBOutlet weak var mallNameLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var likeButton: UIButton!
  
  override func configure() {
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      
      DesignSystemManager.configureProductImageView(productImageView)
      DesignSystemManager.configureMallNameLabel(mallNameLabel)
      DesignSystemManager.configureProductTitleLabel(titleLabel)
      DesignSystemManager.configureProductPriceLabel(priceLabel)
      DesignSystemManager.configureLikeButton(likeButton)
    }
  }
  
  func setData(product: Product, tag: Int) {
    let likeImage = User.default.likes.contains(product.productID)
    ? RADesign.Image.likeFill.image
    : RADesign.Image.like.image
    
    productImageView.kf.setImage(with: product.url)
    mallNameLabel.text = product.mallName
    titleLabel.text = product.title.asMarkdownRedneredAttributeString?.string
    priceLabel.text = product.lprice.formatted
    likeButton.setImage(likeImage, for: .normal)
    likeButton.tag = tag
  }
}
