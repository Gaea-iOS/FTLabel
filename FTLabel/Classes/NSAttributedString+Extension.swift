//
//  NSAttributedString+Extension.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/5.
//
//

import Foundation

extension String {
    public func toAttributedString(attributes: [String: Any]? = nil) -> NSAttributedString {
        return NSAttributedString(string: self, attributes: attributes)
    }
}

extension NSTextAttachment {
    public func toAttributedString() -> NSAttributedString {
        return NSAttributedString(attachment: self)
    }
}


extension UIImage {
    public func toImageTextAttachment(offsetY: CGFloat = 0.0) -> ImageTextAttachment {
        let attachment = ImageTextAttachment()
        attachment.image = self
        attachment.imageOffetY = offsetY
        return attachment
    }
    
    public func toAttributedString(offsetY: CGFloat = 0.0) -> NSAttributedString {
        return self.toImageTextAttachment(offsetY: offsetY).toAttributedString()
    }
}

extension NSAttributedString {
    public static func padding(_ padding: CGFloat) -> NSAttributedString {
        let paddingAttachment = BlankTextAttachment()
        paddingAttachment.width = padding
        let paddingAttributedString = NSAttributedString(attachment: paddingAttachment)
        return paddingAttributedString
    }
    
    public func addingPadding(_ padding: CGFloat) -> NSAttributedString {
        return .padding(padding) + self + .padding(padding)
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
