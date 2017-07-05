//
//  ImageTextAttachment.swift
//  FTLabel
//
//  Created by Luke on 12/1/15.
//  Copyright © 2015 geeklu.com. All rights reserved.
//

import Foundation

public enum ImageTextAttachmentVerticalAlignment {
    case center
}

/// 参考https://stackoverflow.com/questions/22647439/what-is-the-relationship-between-a-font-glyph-ascender-and-descender-in-ios
open class ImageTextAttachment: NSTextAttachment {
    
    open var imageSize: CGSize = .zero
    
    open var baselineOffsetY: CGFloat = 0
    
    // 当imageSize为.zero时生效
    open var isImageScallToFitFontLineHeight: Bool = true
    
    open var attachmentTextVerticalAlignment: ImageTextAttachmentVerticalAlignment = .center
    
    open override func attachmentBounds(for textContainer: NSTextContainer?, proposedLineFragment lineFrag: CGRect, glyphPosition position: CGPoint, characterIndex charIndex: Int) -> CGRect {
        
        guard let image = image else {
            return super.attachmentBounds(for: textContainer, proposedLineFragment: lineFrag, glyphPosition: position, characterIndex: charIndex)
        }
        
        let font = textContainer?.layoutManager?.textStorage?.attribute(NSFontAttributeName, at: charIndex, effectiveRange: nil) as? UIFont
        let baselineHeight = font?.lineHeight ?? lineFrag.size.height
        let fontDescender = font?.descender ?? 0
        
        var attachmentSize: CGSize {
            if !imageSize.equalTo(.zero) {
                return imageSize
            } else if isImageScallToFitFontLineHeight && image.size.height != 0 {
                let width = baselineHeight * image.size.width / image.size.height
                return CGSize(width: width, height: baselineHeight)
            } else {
                return image.size
            }
        }

        switch self.attachmentTextVerticalAlignment {
        case .center:
            var y = fontDescender + baselineOffsetY
            y += (baselineHeight - attachmentSize.height) / 2
            return  CGRect(origin: CGPoint(x: 0, y: y), size: attachmentSize)
        }
    }
}
