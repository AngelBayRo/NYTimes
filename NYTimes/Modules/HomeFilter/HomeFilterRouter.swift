//
//  HomeFilterRouter.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation
import UIKit

protocol HomeFilterRouterProtocol: BaseRouterProtocol {
  func showAlert(message: String)
  func goToTableNews(tableData: TableNewsAssemblyDTO)
}

final class HomeFilterRouter: BaseRouter {
  
  // MARK: VIPER Dependencies
  weak var view: HomeFilterViewProtocol? {
    return super.baseView as? HomeFilterViewProtocol
  }
}

// MARK: - HomeFilterRouterProtocol
extension HomeFilterRouter: HomeFilterRouterProtocol {
  
  func showAlert(message: String) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action: UIAlertAction!) in
      self.dismiss(animated: true)
    }))
    self.present(alert, animated: true)
  }
  
  func goToTableNews(tableData: TableNewsAssemblyDTO) {
    self.pushViewController(TableNewsAssembly.tableNewsView(assemblyDTO: tableData), animated: true)
  }
}
