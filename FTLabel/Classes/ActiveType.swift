//
//  ActiveType.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/4.
//
//

import Foundation

public protocol RegularExpressionConvertible {
    func asRegularExpression() -> NSRegularExpression
}

extension NSRegularExpression: RegularExpressionConvertible {
    public func asRegularExpression() -> NSRegularExpression {
        return self
    }
}

extension NSTextCheckingResult.CheckingType: RegularExpressionConvertible {
    public func asRegularExpression() -> NSRegularExpression {
        var checkingTypes = NSTextCheckingResult.CheckingType()
        checkingTypes = checkingTypes.union(self)
        return try! NSDataDetector(types: checkingTypes.rawValue)
    }
}


public struct ActiveType {
    let regular: RegularExpressionConvertible
    let normalColor: UIColor?
    let highlightedColor: UIColor?
    let tap: ((_ match: String) -> Void)?
    
    public init(regular: RegularExpressionConvertible, normalColor: UIColor? = nil, highlightedColor: UIColor? = nil, tap: ((String) -> Void)? = nil) {
        self.regular = regular
        self.normalColor = normalColor
        self.highlightedColor = highlightedColor
        self.tap = tap
    }
}

extension ActiveType: Hashable, Equatable {
    public var hashValue: Int {
        return regular.asRegularExpression().hashValue
    }
}

public func ==(lhs: ActiveType, rhs: ActiveType) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

extension ActiveType {
    
    public static func hashtag(normalColor: UIColor? = nil, highlightedColor: UIColor? = nil, tap: ((String) -> Void)? = nil) -> ActiveType {
        let regular = try! NSRegularExpression(pattern: "(?:^|(\\s)*|$)#[\\p{L}0-9_]*", options: [.caseInsensitive])
        return ActiveType(regular: regular, normalColor: normalColor, highlightedColor: highlightedColor, tap: tap)
    }

    public static func mention(normalColor: UIColor? = nil, highlightedColor: UIColor? = nil, tap: ((String) -> Void)? = nil) -> ActiveType {
        let regular = try! NSRegularExpression(pattern: "(?:^|(\\s)*|$|[.])@[\\p{L}0-9_]*", options: [.caseInsensitive])
        return ActiveType(regular: regular, normalColor: normalColor, highlightedColor: highlightedColor, tap: tap)
    }
    
    public static func url(normalColor: UIColor? = nil, highlightedColor: UIColor? = nil, tap: ((String) -> Void)? = nil) -> ActiveType {
        return ActiveType(regular: NSTextCheckingResult.CheckingType.link, normalColor: normalColor, highlightedColor: highlightedColor, tap: tap)
    }
    
    public static func phone(normalColor: UIColor? = nil, highlightedColor: UIColor? = nil, tap: ((String) -> Void)? = nil) -> ActiveType {
        return ActiveType(regular: NSTextCheckingResult.CheckingType.phoneNumber, normalColor: normalColor, highlightedColor: highlightedColor, tap: tap)
    }
    
    public static func date(normalColor: UIColor? = nil, highlightedColor: UIColor? = nil, tap: ((String) -> Void)? = nil) -> ActiveType {
        return ActiveType(regular: NSTextCheckingResult.CheckingType.date, normalColor: normalColor, highlightedColor: highlightedColor, tap: tap)
    }

    public static func address(normalColor: UIColor? = nil, highlightedColor: UIColor? = nil, tap: ((String) -> Void)? = nil) -> ActiveType {
        return ActiveType(regular: NSTextCheckingResult.CheckingType.address, normalColor: normalColor, highlightedColor: highlightedColor, tap: tap)
    }
}
