//
//  ProfileImageSettingViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import Foundation

final class ProfileImageSettingViewModel: ViewModel {
  weak var coordinator: AuthCoordinator?
  
  var currentProfile: Observable<User.Profile> = .init(User.default.profile)
  
  var collectionCount: Int {
    return User.Profile.allCases.count
  }
  
  func profile(at indexPath: IndexPath) -> User.Profile {
    return .allCases[indexPath.row]
  }
  
  func isCurrentProfile(at indexPath: IndexPath) -> Bool {
    return User.default.profile == profile(at: indexPath)
  }
  
  func updateProfileImage(at indexPath: IndexPath) {
    let profile: User.Profile = .allCases[indexPath.row]
    currentProfile.set(profile)
    User.default.profile = profile
  }
  
  init(coordinator: AuthCoordinator) {
    self.coordinator = coordinator
  }
}
