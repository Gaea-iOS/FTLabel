//
//  ViewController.swift
//  FTLabel
//
//  Created by wangxiaotao on 07/04/2017.
//  Copyright (c) 2017 wangxiaotao. All rights reserved.
//

import UIKit
import FTLabel

class ViewController: UITableViewController/*, SwiftyLabelDelegate*/ {
    var attributedTexts = [NSAttributedString]()
    override func viewDidLoad() {
        //self.tableView.allowsSelection = false
        //        self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        var i = 0
        while i < 75 {
            
//            let font = UIFont.systemFont(ofSize: 15)
            
            //            let a = NSMutableAttributedString(string: "iamgmldkakjdfjlkajsdj", attributes: [NSFontAttributeName: font])
            //            let a = NSMutableAttributedString(string: "我是中文字符，我是中文字符，我是中文字符，我是中文字符，我是中文字符，我是dkajdlflig，我是中文字符，我是中文字符", attributes: [NSFontAttributeName: font])
//            let a = NSMutableAttributedString(string: "This 2017年6月19日 https://www.baidu.com is a post with #hashtags and 18826404514 a @userhandle.This is a post with #hashtags and a @userhandle.This is a post with #hashtags and a @userhandle.This is a post with #hashtags and a @userhandle.", attributes: [NSFontAttributeName: font])
            let a = NSMutableAttributedString(string: "This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日This 2017年6月19日")

            
            
            let imageAttachment = ImageTextAttachment()
            imageAttachment.image = UIImage(named: "SwiftyText")
//            imageAttachment.attachmentTextVerticalAlignment = .center

//            imageAttachment.padding = 10.0
//            imageAttachment.imageSize = CGSize(width: 30, height: 30)®
//            a.insertAttachment(imageAttachment, atIndex: 5)
            
//            a += imageAttachment.toAttributedString().addingPadding(10)
            
            
            
            let imageAttachment2 = ImageTextAttachment()
            imageAttachment2.image = UIImage(named: "icon_football")
            imageAttachment2.imageOffetY = 15
            //            imageAttachment.attachmentTextVerticalAlignment = .center

//            a.append(NSAttributedString(attachment: imageAttachment).addingPadding(10))
            
//            let imageAttachment2 = ImageTextAttachment()
//            imageAttachment2.image = UIImage(named: "SwiftyText")
//            imageAttachment2.attachmentTextVerticalAlignment = .center
//            imageAttachment2.padding = 10.0
//            a.insertAttachment(imageAttachment2, atIndex: a.length - 28)
            a.append(imageAttachment2.toAttributedString())
            a.append("daksdfadsf".toAttributedString())

            a.append(imageAttachment.toAttributedString())

            self.attributedTexts.append(a)
            i += 1
        }
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
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
        //        cell.swiftyLabel.drawsTextAsynchronously = true
        cell.swiftyLabel.attributedText = attributedText
        //        cell.swiftyLabel.lineBreakMode = .byClipping
        //        cell.swiftyLabel.font = UIFont.systemFont(ofSize: 15)
        //        cell.swiftyLabel.lineSpacing = 20
        //        cell.swiftyLabel.firstLineHeadIndent = 100
        //        cell.swiftyLabel.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        //        cell.swiftyLabel2.attributedText = attributedText
        cell.swiftyLabel.preferredMaxLayoutWidth = tableView.bounds.width
        //        cell.swiftyLabel2.preferredMaxLayoutWidth = tableView.bounds.width
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected")
    }
    
//        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 50
//        }
//    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }
}

