//
//  ViewController.swift
//  FTLabel
//
//  Created by wangxiaotao on 07/04/2017.
//  Copyright (c) 2017 wangxiaotao. All rights reserved.
//

import UIKit
import FTLabel

enum PBMatchEventType {
    case matchEventGoal
    case matchEventYellow
    case matchEventRed
    case matchEventSubstitute
}

extension PBMatchEventType {
    var attributedString: NSAttributedString {
        var image: UIImage? {
            switch self {
            case .matchEventGoal:
                return UIImage(named: "icon_football")
            case .matchEventYellow:
                return UIImage(named: "SwiftyText")
            case .matchEventRed:
                return UIImage(named: "icon_hongpai")
            case .matchEventSubstitute:
                return UIImage(named: "icon_huanren")
            }
        }
        
        let attachment = image!.toImageTextAttachment()
//        attachment.imageSize = CGSize(width: 15, height: 15)

        return attachment.toAttributedString()
    }
}

class ViewController: UITableViewController/*, SwiftyLabelDelegate*/ {
    
    @IBOutlet weak var label: UILabel!
    
    static var eventsDescription: NSAttributedString? {
        return //PBMatchEventType.matchEventGoal.attributedString + .padding(2) +
            NSAttributedString(string: "入球")
            + .padding(20) +
            PBMatchEventType.matchEventYellow.attributedString  + .padding(2) + NSAttributedString(string: "两黄变红")
            + .padding(20) +
            PBMatchEventType.matchEventSubstitute.attributedString + .padding(2) + NSAttributedString(string: "换人")
    }
    
    var attributedTexts = [NSAttributedString]()
    override func viewDidLoad() {
        var i = 0
        while i < 75 {
//            let text1 = NSAttributedString(string: "This 2017年6月19日", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.red])
            let text1 = NSAttributedString(string: "This 2017年6月19日")

            let football: NSAttributedString = {
                let attachment = UIImage(named: "SwiftyText")!.toImageTextAttachment()
//                attachment.imageSize = CGSize(width: 50, height: 50)
                return attachment.toAttributedString()
            }()
//            let text2 = NSAttributedString(string: "@hash daksdfadsf", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 50), NSForegroundColorAttributeName: UIColor.yellow])
            let text2 = NSAttributedString(string: "@hash 我懂得fdfdadf时中文")

//            let image2 = UIImage(named: "SwiftyText")!.toImageTextAttachment().toAttributedString()
            self.attributedTexts.append(text1 + football + text2) //+ text2 + image2)
            i += 1
        }
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        label.font = UIFont.systemFont(ofSize: 25)
        label.attributedText = attributedTexts.first
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.attributedTexts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier = "SwiftyTextCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier) as! SwiftyLabelCell
        let attributedText = self.attributedTexts[indexPath.row]
        cell.swiftyLabel.attributedText = attributedText
//        cell.swiftyLabel.font = UIFont.systemFont(ofSize: 25)
//        cell.swiftyLabel.attributedText = ViewController.eventsDescription
//        cell.swiftyLabel.attributedText = ViewController.eventsDescription

        return cell
    }
//        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 50
//        }
////    
}

