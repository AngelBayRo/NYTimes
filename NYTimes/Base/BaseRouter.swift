//
//  BaseRouter.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation
import UIKit

class BaseRouter {
  // Declared weak for the ARC to destroy them.
  internal weak var baseView: UIViewController?

  required init() {
    // Not implemented
  }

  static func setRoot(navigationController: UIViewController) {
    guard let window = UIApplication.shared.delegate?.window else { return }
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }

  static func logout(viewController: UIViewController? = nil) {
    if let navigationController = (UIApplication.shared.currentUIWindow()?.rootViewController as? UINavigationController) {
      
      navigationController.popToRootViewController(animated: true)

    } else {
      if let viewController = viewController {
        viewController.dismiss(animated: true, completion: nil)
      }
      if let navigationController = (UIApplication.shared.currentUIWindow()?.rootViewController as? UINavigationController) {
        navigationController.popToRootViewController(animated: true)
      }
    }
  }

  // MARK: PRIVATE BASE
  internal func pushViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
    self.baseView?.navigationController?.pushViewController(viewControllerToPresent, animated: flag)
  }

  internal func popViewController(animated: Bool) {
    self.baseView?.navigationController?.popViewController(animated: animated)
  }

  internal func present(_ viewControllerToPresent: UIViewController, animated: Bool) {
    self.baseView?.navigationController?.present(viewControllerToPresent, animated: animated, completion: nil)
  }

  internal func dismiss(animated: Bool) {
    self.baseView?.navigationController?.dismiss(animated: animated, completion: nil)
  }
}
