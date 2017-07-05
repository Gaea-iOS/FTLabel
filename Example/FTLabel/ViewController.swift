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
        var i = 0
        while i < 75 {
            let a = NSMutableAttributedString(string: "This 2017年6月19日")
            a.append(UIImage(named: "icon_football")!.toAttributedString())
            a.append("daksdfadsf".toAttributedString())
            a.append(UIImage(named: "SwiftyText")!.toAttributedString())
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
        cell.swiftyLabel.attributedText = attributedText
        return cell
    }
//        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 50
//        }
//    
}

