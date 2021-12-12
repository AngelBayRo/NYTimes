//
//  AppDelegate.swift
//  NYTimes
//
//  Created by angel.bayon on 7/12/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    
    if window != nil {
      BaseRouter.setRoot(navigationController: HomeFilterAssembly.homeFilterNavigationView())
    }
    
    return true
  }
  
}
