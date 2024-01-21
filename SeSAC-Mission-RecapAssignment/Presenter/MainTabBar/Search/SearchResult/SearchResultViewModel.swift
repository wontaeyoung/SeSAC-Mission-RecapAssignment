//
//  SearchResultViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

final class SearchResultViewModel: ViewModel {
  weak var coordinator: SearchCoordinator?
  
  init(coordinator: SearchCoordinator) {
    self.coordinator = coordinator
  }
}
