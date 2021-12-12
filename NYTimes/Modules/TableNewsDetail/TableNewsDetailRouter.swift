//
//  TableNewsDetailRouter.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

protocol TableNewsDetailRouterProtocol: BaseRouterProtocol {
  func goBack()
}

final class TableNewsDetailRouter: BaseRouter {
  
  // MARK: VIPER Dependencies
  weak var view: TableNewsDetailViewProtocol? {
    return super.baseView as? TableNewsDetailViewProtocol
  }
}

// MARK: - TableNewsDetailRouterProtocol
extension TableNewsDetailRouter: TableNewsDetailRouterProtocol {
  func goBack() {
    self.popViewController(animated: true)
  }
}
