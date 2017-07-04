//
//  NSMutableAttributedString+ImageTextAttachment.swift
//  FTText
//
//  Created by Luke on 1/14/16.
//  Copyright © 2016 geeklu.com. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    
    public func insertAttachment(_ attachment: ImageTextAttachment, atIndex loc: Int) {
        if loc <= self.length {
            var attachmentAttributedString = NSAttributedString(attachment: attachment)
            //Use blank attachment for real image attachment padding
            if attachment.image != nil &&
                attachment.padding > 0 {
                    let paddingAttachment = BlankTextAttachment()
                    paddingAttachment.width = attachment.padding
                    let paddingAttributedString = NSAttributedString(attachment: paddingAttachment)
                    
                    let mutableAttributedString = NSMutableAttributedString()
                    mutableAttributedString.append(paddingAttributedString)
                    mutableAttributedString.append(attachmentAttributedString)
                    mutableAttributedString.append(paddingAttributedString)
                    attachmentAttributedString = mutableAttributedString.copy() as! NSAttributedString
            }
            self.insert(attachmentAttributedString, at: loc)
        }
    }
}
