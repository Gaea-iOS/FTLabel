////
////  NSAttributedString+ImageTextAttachment.swift
////  Pods
////
////  Created by 王小涛 on 2017/7/5.
////
////
//
//import Foundation
//
//extension NSMutableAttributedString {
//
//    public func neighbourFontDescenderWithRange(range: NSRange) -> CGFloat {
//        var fontDescender: CGFloat = 0.0
//        var neighbourAttributs: [String: Any]? = nil
//        if range.location >= 1 {
//            neighbourAttributs = self.attributes(at: range.location - 1, effectiveRange: nil)
//        } else if (NSMaxRange(range) < self.length) {
//            neighbourAttributs = self.attributes(at: NSMaxRange(range) , effectiveRange: nil)
//        }
//        
//        if neighbourAttributs != nil {
//            if let neighbourAttachment = neighbourAttributs![NSAttachmentAttributeName] as? ImageTextAttachment {
//                fontDescender = neighbourAttachment.fontDescender;
//            } else if neighbourAttributs![NSFontAttributeName] != nil {
//                if let neighbourFont = neighbourAttributs![NSFontAttributeName] as? UIFont{
//                    fontDescender = neighbourFont.descender;
//                }
//            }
//        }
//        return fontDescender;
//    }
//    
//    public func insertAttachment(attachment: ImageTextAttachment, atIndex loc:Int) {
//        if loc <= self.length {
//            attachment.fontDescender = self.neighbourFontDescenderWithRange(range: NSMakeRange(loc, 0))
//            insert(attachment.toAttributedString(), at: loc)
//        }
//    }
//    
//    public func append(attatchment: ImageTextAttachment) {
////        let loc = self.length.
//        attatchment.fontDescender = self.neighbourFontDescenderWithRange(range: NSMakeRange(<#T##loc: Int##Int#>, <#T##len: Int##Int#>))
//        append(<#T##attrString: NSAttributedString##NSAttributedString#>)
//    }
//}
