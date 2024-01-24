//
//  SearchDetailViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

import UIKit
import WebKit

final class ProductDetailViewController: BaseViewController, Navigatable {
  
  @IBOutlet weak var productWebView: WKWebView!
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  
  var product: Product?
  
  private var urlRequest: URLRequest {
    let endPoint: NaverAPIEndpoint = .shopDetail(productID: product?.productID ?? "")
    let apiRequest = APIRequest(scheme: .https, host: .naverShopProductDetail, endpoint: endPoint)
    let url = apiRequest.components.url!
    
    return URLRequest(url: url)
  }
  
  override func configure() {
    guard let productID = product?.productID else { return }
    
    let isContains: Bool = User.default.likes.contains(productID)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      image: isContains ? RADesign.Image.likeFill.image : RADesign.Image.like.image,
      style: .plain,
      target: self,
      action: #selector(likeButtonTapped)
    )
    
    loadingIndicator.configure {
      $0.style = .large
      $0.center = self.view.center
      $0.hidesWhenStopped = true
    }
  }
  
  override func setAttribute() {
    guard let product else { return }
    
    navigationItem.title = product.title.asMarkdownRedneredAttributeString?.string
    productWebView.navigationDelegate = self
    productWebView.load(urlRequest)
  }
  
  func setData(product: Product) {
    self.product = product
  }
    
  @objc private func likeButtonTapped(_ sender: UIButton) {
    guard let productID = product?.productID else { return }
    
    User.default.toggleLike(productID: productID)
    updateLikeImage()
  }
  
  private func updateLikeImage() {
    guard let productID = product?.productID else { return }
    
    let isContains: Bool = User.default.likes.contains(productID)
    
    navigationItem.rightBarButtonItem?.image = isContains
    ? RADesign.Image.likeFill.image
    : RADesign.Image.like.image
  }
}

// MARK: - Loading Indicator
extension ProductDetailViewController {
  func startLoading() {
    loadingIndicator.startAnimating()
  }
  
  func stopLoading() {
    loadingIndicator.stopAnimating()
  }
}

// MARK: - WebView Delegate
extension ProductDetailViewController: WKNavigationDelegate {
  // 로드 시작 시
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    startLoading()
  }
  
  // 로드 완료 시
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    stopLoading()
  }
}
