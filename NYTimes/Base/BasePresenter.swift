//
//  BasePresenter.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation
import UIKit

class BasePresenter {
  // Declared weak for the ARC to destroy them.
  internal weak var baseView: BaseViewProtocol?
  internal var baseRouter: BaseRouterProtocol?
  internal var baseInteractor: BaseInteractorInputProtocol?
  
  required init() {
    // Not implemented
  }
}
