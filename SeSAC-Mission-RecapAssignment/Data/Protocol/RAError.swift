//
//  RAError.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/18/24.
//

protocol RAError: Error {
  var logDescrption: String { get }
  var alertDescription: String { get }
}
