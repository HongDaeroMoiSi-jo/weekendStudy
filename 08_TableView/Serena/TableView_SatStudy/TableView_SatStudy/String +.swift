//
//  String +.swift
//  TableView_SatStudy
//
//  Created by Hyun A Song on 2023/07/01.
//

import UIKit

extension String {
    func addAttributeBigFontForKeyword(keyword: String) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        
        attributeString.addAttribute(.font,
                                     value: UIFont.preferredFont(forTextStyle: .headline),
                                     range: (self as NSString).range(of: keyword))
        return attributeString
    }
}

