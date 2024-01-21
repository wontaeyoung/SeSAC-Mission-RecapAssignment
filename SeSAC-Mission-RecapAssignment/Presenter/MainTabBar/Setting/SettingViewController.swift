//
//  SettingViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

final class SettingViewController: BaseTableViewController, Navigatable, ViewModelController {
  
  private var viewModel: SettingViewModel?
  
  override func viewDidLayoutSubviews() {
    
  }
  
  override func configure() {
    
  }
  
  override func setAttribute() {
    
  }
  
  func setViewModel(_ viewModel: SettingViewModel) {
    self.viewModel = viewModel
  }
}

