//
//  DTO.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

protocol DTO {
  associatedtype Model: RAModel
  
  var asModel: Model { get }
}
