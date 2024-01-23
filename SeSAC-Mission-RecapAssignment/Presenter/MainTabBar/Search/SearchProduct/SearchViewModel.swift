//
//  SearchViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

final class SearchViewModel: ViewModel {
  weak var coordinator: SearchCoordinator?
  
  init(coordinator: SearchCoordinator) {
    self.coordinator = coordinator
  }
  
  func showSearchResultViewController(keyword: String) {
    coordinator?.showSearchResultViewController(keyword: keyword)
  }
  
  func showDeleteAllAlert(completion: @escaping () -> Void) {
    coordinator?.showDeleteAllAlert(completion: completion)
  }
}
