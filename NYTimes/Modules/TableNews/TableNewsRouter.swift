//
//  TableNewsRouter.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

protocol TableNewsRouterProtocol: BaseRouterProtocol {
  func goBack()
  func goToTableNewsDetail(detailData: TableNewsDetailAssemblyDTO)
}

final class TableNewsRouter: BaseRouter {
  
  // MARK: VIPER Dependencies
  weak var view: TableNewsViewProtocol? {
    return super.baseView as? TableNewsViewProtocol
  }
}

// MARK: - TableNewsRouterProtocol
extension TableNewsRouter: TableNewsRouterProtocol {
  func goBack() {
    self.popViewController(animated: true)
  }
  
  func goToTableNewsDetail(detailData: TableNewsDetailAssemblyDTO) {
    self.pushViewController(TableNewsDetailAssembly.tableNewsDetailView(assemblyDTO: detailData), animated: true)
  }
}
