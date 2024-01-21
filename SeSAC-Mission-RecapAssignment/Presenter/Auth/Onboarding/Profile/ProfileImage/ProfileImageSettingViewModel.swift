//
//  ProfileImageSettingViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

final class ProfileImageSettingViewModel: ViewModel {
  weak var coordinator: AuthCoordinator?
  
  init(coordinator: AuthCoordinator) {
    self.coordinator = coordinator
  }
}
