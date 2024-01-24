//
//  SearchResultViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

import UIKit

final class SearchResultViewController: BaseCollectionViewController, Navigatable, ViewModelController {
  
  @IBOutlet weak var resultCountLabel: UILabel!
  @IBOutlet var sortButtons: [UIButton]!
  @IBOutlet weak var productCollectionView: UICollectionView!
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  
  private var viewModel: SearchResultViewModel?
  private var searchKeyword: String = ""
  
  private var products: [Product] = [] {
    didSet {
      stopLoading()
      productCollectionView.reloadData()
    }
  }
  
  private var currentSortType: NaverAPIEndpoint.Sort = .sim {
    didSet {
      guard oldValue != currentSortType else { return }
      
      configure()
      viewModel?.apiContainer.resetPage()
      resetProducts()
      callRequest()
      startLoading()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    productCollectionView.reloadData()
  }
  
  override func configure() {
    loadingIndicator.configure {
      $0.style = .large
      $0.center = self.view.center
      $0.hidesWhenStopped = true
      $0.startAnimating()
    }
    
    DesignSystemManager.configureResultCountLabel(resultCountLabel)
    
    sortButtons.enumerated().forEach { index, button in
      button.tag = index
      DesignSystemManager.configureSortButton(button, isSelected: index == currentSortType.tag)
    }
  }
  
  override func setAttribute() {
    navigationItem.title = searchKeyword
    navigationItem.backButtonTitle = ""
    
    sortButtons.enumerated().forEach { index, button in
      let title: String = NaverAPIEndpoint.Sort.allCases[index].title
      button.setTitle(title, for: .normal)
      button.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
    }
    
    callRequest()
  }
  
  override func register() {
    self.collectionCellRegister(productCollectionView, cellType: ProductCollectionViewCell.self)
    self.setCollectionViewConfiguration(productCollectionView)
  }
  
  override func setLayout() {
    let cellCount: Int = 2
    let cellSpacing: CGFloat = 16
    let cellWidth: CGFloat = (UIScreen.main.bounds.width - (cellSpacing * CGFloat(2 + cellCount - 1))) / CGFloat(cellCount)
    
    let layout = UICollectionViewFlowLayout().configured {
      $0.itemSize = CGSize(width: cellWidth, height: cellWidth + 120)
      $0.sectionInset = UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
      $0.minimumLineSpacing = cellSpacing
      $0.minimumInteritemSpacing = cellSpacing
    }
    
    productCollectionView.collectionViewLayout = layout
  }
  
  func setViewModel(_ viewModel: SearchResultViewModel) {
    self.viewModel = viewModel
  }
  
  func setData(keyword: String) {
    searchKeyword = keyword
  }
  
  @objc private func sortButtonTapped(_ sender: UIButton) {
    currentSortType = .allCases[sender.tag]
  }
  
  @objc private func likeButtonTapped(_ sender: UIButton) {
    let productID: String = products[sender.tag].productID
    User.default.toggleLike(productID: productID)
    productCollectionView.reloadItems(at: [IndexPath(row: sender.tag, section: 0)])
  }
  
  private func resetProducts() {
    self.products.removeAll()
  }
  
  private func callRequest() {
    viewModel?.callRequest(query: searchKeyword, sort: currentSortType) { (count, products) in
      DispatchQueue.main.async { [weak self] in
        guard let self else { return }
        
        resultCountLabel.text = "\(count.formatted) 개의 검색 결과"
        self.products.append(contentsOf: products)
      }
    }
  }
}

// MARK: - Loading Indicator
extension SearchResultViewController {
  func startLoading() {
    loadingIndicator.startAnimating()
  }
  
  func stopLoading() {
    loadingIndicator.stopAnimating()
  }
}

// MARK: - Collection View Delegate
extension SearchResultViewController: CollectionConfigurable {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return products.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: ProductCollectionViewCell.identifier,
      for: indexPath
    ) as! ProductCollectionViewCell
    
    let row: Int = indexPath.row
    let product: Product = products[row]
    
    cell.setData(product: product, tag: row)
    cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let product: Product = products[indexPath.row]
    
    viewModel?.showProductDetailViewController(product: product)
  }
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) { 
    guard let viewModel, !viewModel.apiContainer.isEnd else { return }
    
    indexPaths
      .forEach { path in
        if path.row + 1 == products.count {
          callRequest()
        }
      }
  }
}
