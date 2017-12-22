//
//  ViewController.swift
//  iOS11UIScreenIsCaptured
//
//  Created by hiraya.shingo on 2017/12/21.
//  Copyright © 2017 hiraya.shingo. All rights reserved.
//

import UIKit

// - [Technical Q&A QA1970: Responding to screen capture in iOS 11.](https://developer.apple.com/library/content/qa/qa1970/_index.html#//apple_ref/doc/uid/DTS40017687)
// - [UIScreenCapturedDidChange - NSNotification.Name | Apple Developer Documentation](https://developer.apple.com/documentation/foundation/nsnotification.name/2921652-uiscreencaptureddidchange#)
// - [isCaptured - UIScreen | Apple Developer Documentation](https://developer.apple.com/documentation/uikit/uiscreen/2921651-iscaptured)

class ViewController: UIViewController {

    @IBOutlet weak var normalLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var kvoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isCaptured = UIScreen.main.isCaptured
        normalLabel.text = isCaptured ? "キャプチャされています!" : "キャプチャされていません!"
        normalLabel.textColor = isCaptured ? .red : .black
    }
}
