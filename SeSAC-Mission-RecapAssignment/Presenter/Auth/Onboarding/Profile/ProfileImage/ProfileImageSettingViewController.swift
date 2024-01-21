//
//  ProfileImageSettingViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

/// 프로필 이미지 탭 제스처에 설정뷰 푸쉬
/// 컬렉션 셀 설정 로직 책임 분리하고 조금 더 이쁘게
import UIKit

final class ProfileImageSettingViewController: BaseCollectionViewController, Navigatable, ViewModelController {
  
  @IBOutlet weak var currentProfileImageView: UIImageView!
  @IBOutlet weak var profileImageCollectionView: UICollectionView!
  
  private var viewModel: ProfileImageSettingViewModel?
  
  override func viewDidLayoutSubviews() {
    
  }
  
  override func configure() {

  }
  
  override func setAttribute() {
    collectionCellRegister(profileImageCollectionView, cellType: ProfileImageCollectionViewCell.self)
    setCollectionViewConfiguration(profileImageCollectionView)
  }
  
  func setViewModel(_ viewModel: ProfileImageSettingViewModel) {
    self.viewModel = viewModel
  }
}

extension ProfileImageSettingViewController: CollectionConfigurable {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    User.Profile.allCases.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let profile: User.Profile = .allCases[indexPath.row]
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: ProfileImageCollectionViewCell.identifier,
      for: indexPath
    ) as! ProfileImageCollectionViewCell
    
    cell.profileImageView.image = profile.image
    
    if User.default.profile == profile {
      DesignSystemManager.configureSelectedImageView(cell.profileImageView)
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) { }
}
