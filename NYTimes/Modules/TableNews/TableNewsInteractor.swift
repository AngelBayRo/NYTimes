//
//  TableNewsInteractor.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

protocol TableNewsInputInteractor: BaseInteractorInputProtocol {
  func getTableData()
}

class TableNewsInteractor: BaseInteractor {
  
  // MARK: VIPER Dependencies
  weak var presenter: TableNewsInteractorOutputProtocol? {
    return super.basePresenter as? TableNewsInteractorOutputProtocol
  }
  var tableNewsAssemblyDTO: TableNewsAssemblyDTO?
  var provider: TableNewsProviderProtocol?
}

// MARK: - TableNewsInputInteractor
extension TableNewsInteractor: TableNewsInputInteractor {
  
  func getTableData() {
    self.presenter?.setDataContent(response: tableNewsAssemblyDTO?.model ?? [])
  }
}
