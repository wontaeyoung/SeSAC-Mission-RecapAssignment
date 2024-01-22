//
//  SettingViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class SettingViewController: BaseTableViewController, Navigatable, ViewModelController {
  
  @IBOutlet weak var settingTableView: UITableView!
  
  private var viewModel: SettingViewModel?
  private let settingItems: [String] = ["공지사항", "자주 묻는 질문", "1:1 문의", "알림 설정", "처음부터 시작하기"]
  
  override func setAttribute() {
    navigationItem.title = "설정"
  }
  
  override func register() {
    self.tableCellRegister(settingTableView, cellType: SettingProfileTableViewCell.self)
    self.setTableViewConfiguration(settingTableView)
  }
  
  func setViewModel(_ viewModel: SettingViewModel) {
    self.viewModel = viewModel
  }
}

extension SettingViewController: TableConfigurable {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 1 : settingItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    
    if indexPath.section == 0 {
      cell = tableView.dequeueReusableCell(withIdentifier: SettingProfileTableViewCell.identifier, for: indexPath)
      
    } else {
      cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath)
      
      let row: Int = indexPath.row
      print(settingItems[row])
      cell.textLabel?.text = settingItems[row]
      cell.textLabel?.textColor = .raText
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return indexPath.section == 0 ? 100 : 40
  }
}
