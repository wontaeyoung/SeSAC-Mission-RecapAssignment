//
//  SearchResultViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

import UIKit

final class SearchResultViewController: BaseCollectionViewController, Navigatable, ViewModelController {
  
  private var viewModel: SearchResultViewModel?
  private var products: [Product] = []
  private var searchKeyword: String = ""
  private var currentSortType: NaverAPIEndpoint.Sort = .sim {
    didSet {
      
    }
  }
  
  override func viewDidLayoutSubviews() {
    
  }
  
  override func configure() {
    
  }
  
  override func setAttribute() {
    navigationItem.title = "캠핑카"
  }
  
  func setViewModel(_ viewModel: SearchResultViewModel) {
    self.viewModel = viewModel
  }
  
  func setData(keyword: String) {
    searchKeyword = keyword
  }
}
