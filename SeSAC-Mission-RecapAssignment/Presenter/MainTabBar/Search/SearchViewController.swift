//
//  SearchViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

final class SearchViewController: BaseTableViewController, Navigatable, ViewModelController {
  
  private var viewModel: SearchViewModel?
  
  override func viewDidLayoutSubviews() {
    
  }
  
  override func configure() {
    
  }
  
  override func setAttribute() {
    
  }
  
  func setViewModel(_ viewModel: SearchViewModel) {
    self.viewModel = viewModel
  }
}

