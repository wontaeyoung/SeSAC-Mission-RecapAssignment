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
  
  private var viewModel: ProfileImageSettingViewModel!
  
  override func viewDidLayoutSubviews() {
    DesignSystemManager.configureProfileImageView(currentProfileImageView)
    DesignSystemManager.configureSelectedImageView(currentProfileImageView)
  }
  
  override func bind() {
    viewModel.currentProfile.bind { [weak self] in
      guard let self else { return }
      
      currentProfileImageView.image = $0.image
      profileImageCollectionView.reloadData()
    }
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
    return viewModel.collectionCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: ProfileImageCollectionViewCell.identifier,
      for: indexPath
    ) as! ProfileImageCollectionViewCell
    
    let profile = viewModel.profile(at: indexPath)
    cell.profileImageView.image = profile.image
    
    if viewModel.isCurrentProfile(at: indexPath) {
      DesignSystemManager.configureSelectedImageView(cell.profileImageView)
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    viewModel.updateProfileImage(at: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) { }
}
