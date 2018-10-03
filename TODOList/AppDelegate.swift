//
//  AppDelegate.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    self.window = UIWindow()
    self.window?.makeKeyAndVisible()
    self.window?.frame = UIScreen.main.bounds
    self.window?.backgroundColor = UIColor.white
    ApplicationDependency.manager.coordinator.start(window: self.window!)
    return true
  }
}

