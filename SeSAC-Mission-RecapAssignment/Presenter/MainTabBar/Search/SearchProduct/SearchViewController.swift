//
//  SearchViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class SearchViewController: BaseTableViewController, Navigatable, ViewModelController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  
  @IBOutlet weak var emptyImageView: UIImageView!
  @IBOutlet weak var emptyLabel: UILabel!
  private lazy var emptyView: [UIView] = [emptyImageView, emptyLabel]
  
  @IBOutlet weak var recentSearchLabel: UILabel!
  @IBOutlet weak var deleteAllButton: UIButton!
  @IBOutlet weak var recentSearchTableView: UITableView!
  private lazy var searchKeywordView: [UIView] = [recentSearchLabel, deleteAllButton, recentSearchTableView]
  
  private var viewModel: SearchViewModel?
  private var recentSearches: [String] = User.default.recentSearches {
    didSet {
      hideViewBy(isKeywordEmpty: recentSearches.isEmpty)
      recentSearchTableView.reloadData()
    }
  }
  
  override func configure() {
    DesignSystemManager.configureSearchBar(searchBar)
    DesignSystemManager.configureEmptyLabel(emptyLabel)
    DesignSystemManager.configureRecentSearchLabel(recentSearchLabel)
    
    hideViewBy(isKeywordEmpty: User.default.recentSearches.isEmpty)
  }
  
  override func setAttribute() {
    navigationItem.title = User.default.nickname + "님의 새싹쇼핑"
    navigationItem.backButtonTitle = ""
    searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
    searchBar.delegate = self
    emptyImageView.image = .empty
    emptyLabel.text = "최근 검색어가 없어요"
    recentSearchLabel.text = "최근 검색"
    deleteAllButton.setTitle("모두 지우기", for: .normal)
    deleteAllButton.addTarget(self, action: #selector(deleteAllButtonTapped), for: .touchUpInside)
  }
  
  override func register() {
    self.tableCellRegister(recentSearchTableView, cellType: SearchTableViewCell.self)
    self.setTableViewConfiguration(recentSearchTableView)
  }
  
  func setViewModel(_ viewModel: SearchViewModel) {
    self.viewModel = viewModel
  }
  
  private func hideViewBy(isKeywordEmpty: Bool) {
    searchKeywordView.forEach { $0.isHidden = isKeywordEmpty }
    emptyView.forEach { $0.isHidden = !isKeywordEmpty }
    
    self.finishableKeyboardEditing = isKeywordEmpty
  }
  
  private func bindRecentSearches() {
    self.recentSearches = User.default.recentSearches
  }
  
  @objc private func deleteAllButtonTapped() {
    viewModel?.showDeleteAllAlert { [weak self] in
      guard let self else { return }
      
      User.default.recentSearches.removeAll()
      bindRecentSearches()
    }
  }
}

extension SearchViewController: TableConfigurable {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recentSearches.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
    let row: Int = indexPath.row
    let keyword: String = recentSearches[row]
    
    cell.selectionStyle = .none
    cell.setData(text: keyword, tag: row) { [weak self] in
      guard let self else { return }
      
      bindRecentSearches()
      hideViewBy(isKeywordEmpty: User.default.recentSearches.isEmpty)
    }
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    searchNewKeyword(recentSearches[indexPath.row])
  }
}

extension SearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchNewKeyword(searchBar.text!)
  }
  
  func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if range.location == .zero, text == " " {
      return false
    }
    
    return true
  }
  
  private func searchNewKeyword(_ keyword: String) {
    User.default.addNewSearchKeyword(keyword)
    viewModel?.showSearchResultViewController(keyword: keyword)
    bindRecentSearches()
    view.endEditing(true)
  }
}
