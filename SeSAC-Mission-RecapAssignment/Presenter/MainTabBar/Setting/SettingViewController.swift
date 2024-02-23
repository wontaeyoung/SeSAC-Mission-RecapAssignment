//
//  SettingViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class SettingViewController: BaseTableViewController, Navigatable, ViewModelController {
  
  @IBOutlet weak var settingTableView: UITableView!
  
  private var viewModel: SettingViewModel!
  
  override func viewWillAppear(_ animated: Bool) {
    settingTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
  }
  
  override func setAttribute() {
    navigationItem.title = "설정"
    navigationItem.backButtonTitle = ""
  }
  
  override func register() {
    let xib = UINib(nibName: SettingProfileTableViewCell.identifier, bundle: nil)
    settingTableView.register(xib, forCellReuseIdentifier: SettingProfileTableViewCell.identifier)
    self.setTableViewConfiguration(settingTableView)
  }
  
  func setViewModel(_ viewModel: SettingViewModel) {
    self.viewModel = viewModel
  }
  
  func presentLikesCountInfoAlert() {
    viewModel.showLikeCountInfoAlert()
  }
}

extension SettingViewController: TableConfigurable {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 1 : viewModel.settingItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: SettingProfileTableViewCell.identifier, for: indexPath) as! SettingProfileTableViewCell
      cell.updateProfile()
      
      return cell
      
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath)
      
      let row: Int = indexPath.row
      cell.textLabel?.text = viewModel.settingItems[row]
      cell.textLabel?.textColor = .raText
      cell.textLabel?.font = RADesign.Font.captionBlack.font
      
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.section == 0 {
      viewModel?.showNicknameSettingViewController()
    } else if indexPath.row == viewModel.settingItems.count - 1 {
      viewModel.showResetAlert()
    }
    
    tableView.reloadRows(at: [indexPath], with: .automatic)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return indexPath.section == 0 ? 100 : 40
  }
}
