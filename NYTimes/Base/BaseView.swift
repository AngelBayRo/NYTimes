//
//  BaseView.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation
import UIKit

class BaseView: UIViewController {
  internal var basePresenter: BasePresenterProtocol?

  var vSpinner : UIView?

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationController?.navigationBar.isHidden = true
    basePresenter?.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    basePresenter?.viewWillAppear(animated: animated)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    basePresenter?.viewDidAppear(animated: animated)
  }

  func showSpinner() {
    let spinnerView = UIView.init(frame: self.view.bounds)
    spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    let ai = UIActivityIndicatorView.init(style: .medium)
    ai.startAnimating()
    ai.center = spinnerView.center

    DispatchQueue.main.async {
      spinnerView.addSubview(ai)
      self.view.addSubview(spinnerView)
    }

    vSpinner = spinnerView
  }

  func removeSpinner() {
    DispatchQueue.main.async {
      self.vSpinner?.removeFromSuperview()
      self.vSpinner = nil
    }
  }
}

// MARK: BaseViewControllerProtocol
extension BaseView: BaseViewControllerProtocol {}
