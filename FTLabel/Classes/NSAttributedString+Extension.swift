//
//  NSAttributedString+Extension.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/5.
//
//

import Foundation

extension NSTextAttachment {
    public func toAttributedString() -> NSAttributedString {
        return NSAttributedString(attachment: self)
    }
}

extension NSAttributedString {
    public func padding(_ padding: CGFloat) -> NSAttributedString {
        let paddingAttachment = BlankTextAttachment()
        paddingAttachment.width = padding
        let paddingAttributedString = NSAttributedString(attachment: paddingAttachment)
        return paddingAttributedString
    }
    
    public func addingPadding(_ padding: CGFloat) -> NSAttributedString {
        return self.padding(padding) + self + self.padding(padding)
    }
}

public func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
    let mutableAttributedString = NSMutableAttributedString()
    mutableAttributedString.append(lhs.copy() as! NSAttributedString)
    mutableAttributedString.append(rhs.copy() as! NSAttributedString)
    return mutableAttributedString
}

/**
 Blank placeholder usded for padding
 */
private class BlankTextAttachment: NSTextAttachment {
    open var width: CGFloat {
        get{
            return bounds.width
        }
        set {
            bounds.size.width = newValue
            bounds.size.height = 1
        }
    }
}
