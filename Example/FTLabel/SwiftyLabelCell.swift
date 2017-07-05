//
//  SwiftyLabelCell.swift
//  SwiftyText
//
//  Created by Luke on 1/5/16.
//  Copyright © 2016 geeklu.com. All rights reserved.
//

import Foundation
import UIKit
import FTLabel
import SnapKit

class SwiftyLabelCell: UITableViewCell {

    lazy var swiftyLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        
//        let type1 = ActiveType.hashtag(normalColor: .blue, highlightedColor: .red, tap: { text in
//            print("tap on hashtag \(text)")
//        })
//        let type2 = ActiveType.mention(normalColor: .cyan, highlightedColor: .purple, tap: { text in
//            print("tap on mention \(text)")
//        })
//        
//        let type3 = ActiveType.url(normalColor: .gray, highlightedColor: .brown, tap: { text in
//            print("tap on url \(text)")
//        })
//
//        let type4 = ActiveType.date(normalColor: .gray, highlightedColor: .brown, tap: { text in
//            print("tap on url \(text)")
//        })
        
//        label.enabledTypes = [type1, type2, type3, type4]
        label.textColor = .black
        self.addSubview(label)
        
        label.snp.updateConstraints {
            $0.edges.equalToSuperview()
        }
//        label.snp.updateConstraints({
//            $0.centerX.equalToSuperview()
//            $0.centerY.equalToSuperview()
//            $0.left.equalToSuperview()
//            $0.right.equalToSuperview()
//
//        })
        label.backgroundColor = .blue
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

