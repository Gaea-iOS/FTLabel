//
//  ImageTextAttachment.swift
//  FTLabel
//
//  Created by Luke on 12/1/15.
//  Copyright © 2015 geeklu.com. All rights reserved.
//

import Foundation

public enum TBTextAttachmentTextVerticalAlignment {
    case center
}

// 参考https://stackoverflow.com/questions/22647439/what-is-the-relationship-between-a-font-glyph-ascender-and-descender-in-ios
open class ImageTextAttachment: NSTextAttachment {

    open var padding: CGFloat = 0.0
    
    open var imageSize: CGSize = .zero
    
    // 当imageSize为.zero时生效
    open var isImageScallToFitFontLineHeight: Bool = true
    
    open var attachmentTextVerticalAlignment: TBTextAttachmentTextVerticalAlignment = .center
    
    open override func attachmentBounds(for textContainer: NSTextContainer?, proposedLineFragment lineFrag: CGRect, glyphPosition position: CGPoint, characterIndex charIndex: Int) -> CGRect {
        
        guard let image = image else {
            return super.attachmentBounds(for: textContainer, proposedLineFragment: lineFrag, glyphPosition: position, characterIndex: charIndex)
        }
        
        let font = textContainer?.layoutManager?.textStorage?.attribute(NSFontAttributeName, at: 0, effectiveRange: nil) as? UIFont
        let fontLineHeight = font?.lineHeight ?? lineFrag.size.height
        let fontDescender = font?.descender ?? 0
        
        var attachmentSize: CGSize {
            if !imageSize.equalTo(.zero) {
                return imageSize
            } else if isImageScallToFitFontLineHeight && image.size.height != 0 {
                let width = fontLineHeight * image.size.width / image.size.height
                return CGSize(width: width, height: fontLineHeight)
            } else {
                return image.size
            }
        }
        
        switch self.attachmentTextVerticalAlignment {
        case .center :
            let y = (fontLineHeight - attachmentSize.height) / 2 + fontDescender
            return  CGRect(origin: CGPoint(x: 0, y: y), size: attachmentSize)
        }
    }
}


/**
 Blank placeholder usded for image padding
 */
open class BlankTextAttachment: NSTextAttachment {
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
