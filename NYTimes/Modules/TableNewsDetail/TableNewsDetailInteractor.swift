//
//  TableNewsDetailInteractor.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

protocol TableNewsDetailInputInteractor: BaseInteractorInputProtocol {
  func getURLFromData()
}

class TableNewsDetailInteractor: BaseInteractor {
  
  // MARK: VIPER Dependencies
  weak var presenter: TableNewsDetailInteractorOutputProtocol? {
    return super.basePresenter as? TableNewsDetailInteractorOutputProtocol
  }
  var tableNewsDetailAssemblyDTO: TableNewsDetailAssemblyDTO?
  var provider: TableNewsDetailProviderProtocol?
}

// MARK: - TableNewsDetailInputInteractor
extension TableNewsDetailInteractor: TableNewsDetailInputInteractor {
  func getURLFromData() {
    self.presenter?.gotUrlString(url: tableNewsDetailAssemblyDTO?.url ?? "")
  }
}
