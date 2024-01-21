//
//  BaseTableViewCell.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
  
  /// class 타입 프로퍼티를 선언하면 오버라이드가 가능하기 때문에, 상속 후에 identifier를 호출하면 상속받은 타입의 이름이 반환됨
  /// class var는 서브클래스의 컨텍스트에서 결정되기 때문!
  /// static var는 오버라이딩이 불가하기 때문에 이러한 로직을 수행할 수 없음
  class var identifier: String {
    return String(describing: self)
  }
  
  @MainActor func configure() { }
  @MainActor func setAttribute() { }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.backgroundColor = .clear
    self.contentView.backgroundColor = .clear
    
    configure()
    setAttribute()
  }
}
