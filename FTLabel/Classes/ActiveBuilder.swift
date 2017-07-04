//
//  ActiveBuilder.swift
//  FTLabel
//
//  Created by Pol Quintana on 04/09/16.
//  Copyright © 2016 Optonaut. All rights reserved.
//

import Foundation

struct ActiveBuilder {
    
    static func createElements(from text: String,
                               for type: ActiveType,
                               range: NSRange) -> [ElementTuple] {
        
        let matches = type.regular.asRegularExpression().matches(in: text, options: [], range: range)
        let nsstring = text as NSString
        var elements: [ElementTuple] = []
        
        for match in matches where match.range.length > 1 {
            let word = nsstring.substring(with: match.range)
                .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            let element = word
            elements.append((match.range, element, type))
        }
        return elements
    }
}
