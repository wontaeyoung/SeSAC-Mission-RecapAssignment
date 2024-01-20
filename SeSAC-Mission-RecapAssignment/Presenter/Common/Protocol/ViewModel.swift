//
//  ViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

protocol ViewModel {
  associatedtype CoordinatorImpl: Coordinator
  
  var coordinator: CoordinatorImpl? { get set }
}
