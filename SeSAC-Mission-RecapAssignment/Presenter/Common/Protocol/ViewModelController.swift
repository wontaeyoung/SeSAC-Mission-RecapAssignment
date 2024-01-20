//
//  ViewModelController.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/20/24.
//

protocol ViewModelController {
  associatedtype ViewModelImpl: ViewModel
  
  func setViewModel(_ viewModel: ViewModelImpl)
}
