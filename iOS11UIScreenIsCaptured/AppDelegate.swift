//
//  AppDelegate.swift
//  iOS11UIScreenIsCaptured
//
//  Created by hiraya.shingo on 2017/12/21.
//  Copyright © 2017 hiraya.shingo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        prepareNotification()
        prepareKVO()
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        guard
            let viewController = self.window?.rootViewController as? ViewController,
            let normalLabel = viewController.normalLabel else {
                return
        }
        let isCaptured = UIScreen.main.isCaptured
        normalLabel.text = isCaptured ? "キャプチャされています!" : "キャプチャされていません!"
        normalLabel.textColor = isCaptured ? .red : .black
    }
    
    func prepareNotification() {
        NotificationCenter.default.addObserver(forName: .UIScreenCapturedDidChange,
                                               object: nil,
                                               queue: nil) { _ in
                                                guard
                                                    let viewController = self.window?.rootViewController as? ViewController,
                                                    let notificationLabel = viewController.notificationLabel else {
                                                        return
                                                }
                                                let isCaptured = UIScreen.main.isCaptured
                                                notificationLabel.text = isCaptured ? "キャプチャされています!" : "キャプチャされていません!"
                                                notificationLabel.textColor = isCaptured ? .red : .black
        }
    }
    
    func prepareKVO() {
        UIScreen.main.addObserver(self,
                                  forKeyPath: #keyPath(UIScreen.isCaptured),
                                  options: [.new],
                                  context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == #keyPath(UIScreen.isCaptured) else { return }
        
        let isCaptured = change![NSKeyValueChangeKey.newKey] as! Bool
        guard
            let viewController = window?.rootViewController as? ViewController,
            let kvoLabel = viewController.kvoLabel else {
                return
        }
        kvoLabel.text = isCaptured ? "キャプチャされています!" : "キャプチャされていません!"
        kvoLabel.textColor = UIScreen.main.isCaptured ? .red : .black
    }
}
