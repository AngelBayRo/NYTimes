//
//  BaseProtocols.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

protocol BaseViewControllerProtocol: AnyObject {
  var basePresenter: BasePresenterProtocol? {get set}
}

// Protocol used to the Presenter can communicate with View
protocol BaseViewProtocol: AnyObject {
  
}

// Protocol used to the View can communicate with Presenter
protocol BasePresenterProtocol: AnyObject {
  func viewDidLoad()
  func viewWillAppear(animated: Bool)
  func viewDidAppear(animated: Bool)
}

extension BasePresenterProtocol {
  func viewDidLoad() {
    // Optional method
  }
  func viewWillAppear(animated: Bool) {
    // Optional method
  }
  func viewDidAppear(animated: Bool) {
    // Optional method
  }
}

// Protocol used to the Presenter can communicate with Interactor
protocol BaseInteractorInputProtocol: AnyObject {
  
}

// Protocol used to the Interactor can communicate with Presenter
protocol BaseInteractorOutputProtocol: AnyObject {
  
}

// Protocol used to the Presenter can communicate with Router
protocol BaseRouterProtocol: AnyObject {
  
}
