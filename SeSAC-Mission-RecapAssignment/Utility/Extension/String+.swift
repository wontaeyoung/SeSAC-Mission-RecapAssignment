//
//  String+.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/19/24.
//

import Foundation

extension String {
  
  static func combineWithLineBreaks(_ strings: String...) -> Self {
    return strings.joined(separator: "\n")
  }
  
  var asMarkdownRedneredAttributeString: NSAttributedString? {
    guard let data = self.data(using: .utf8) else {
      return nil
    }
    
    let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
      .documentType: NSAttributedString.DocumentType.html,
      .characterEncoding: String.Encoding.utf8.rawValue
    ]
    
    return try? NSAttributedString(data: data, options: options, documentAttributes: nil)
  }
}
