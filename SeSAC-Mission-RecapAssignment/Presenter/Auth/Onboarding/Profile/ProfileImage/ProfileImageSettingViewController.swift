//
//  ProfileImageSettingViewController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/21/24.
//

import UIKit

final class ProfileImageSettingViewController: BaseCollectionViewController, Navigatable, ViewModelController {
  
  @IBOutlet weak var currentProfileImageView: UIImageView!
  @IBOutlet weak var profileImageCollectionView: UICollectionView!
  
  private var viewModel: ProfileImageSettingViewModel?
  
  override func viewDidLayoutSubviews() {
    DesignSystemManager.configureProfileImageView(currentProfileImageView)
    DesignSystemManager.configureSelectedImageView(currentProfileImageView)
  }
  
  override func setAttribute() {
    currentProfileImageView.image = User.default.profile.image
  }
  
  override func register() {
    collectionCellRegister(profileImageCollectionView,
                           cellType: ProfileImageCollectionViewCell.self)
    setCollectionViewConfiguration(profileImageCollectionView)
  }
  
  override func setLayout() {
    let cellCount: Int = 4
    let cellSpacing: CGFloat = 16
    let cellWidth: CGFloat = (UIScreen.main.bounds.width - (cellSpacing * CGFloat(2 + cellCount - 1))) / CGFloat(cellCount)
    
    let layout = UICollectionViewFlowLayout().configured {
      $0.itemSize = CGSize(width: cellWidth, height: cellWidth)
      $0.sectionInset = UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
      $0.minimumLineSpacing = cellSpacing
      $0.minimumInteritemSpacing = cellSpacing
    }
    
    profileImageCollectionView.collectionViewLayout = layout
  }
  
  func setViewModel(_ viewModel: ProfileImageSettingViewModel) {
    self.viewModel = viewModel
  }
  
  func setNavigationTitle(with title: String) {
    self.navigationItem.title = title
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
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    updateProfileImage(with: .allCases[indexPath.row])
  }
  
  private func updateProfileImage(with profile: User.Profile) {
    User.default.profile = profile
    currentProfileImageView.image = User.default.profile.image
    profileImageCollectionView.reloadData()
  }
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) { }
}
