//
//  TableNewsDetailPresenter.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

protocol TableNewsDetailPresenterProtocol: BasePresenterProtocol {
  func goBack()
}

protocol TableNewsDetailInteractorOutputProtocol: BaseInteractorOutputProtocol {
  func gotUrlString(url: String)
}

class TableNewsDetailPresenter: BasePresenter {
  
  // MARK: VIPER Dependencies
  weak var view: TableNewsDetailViewProtocol? {
    return super.baseView as? TableNewsDetailViewProtocol
  }
  
  var router: TableNewsDetailRouterProtocol? {
    return super.baseRouter as? TableNewsDetailRouterProtocol
  }
  
  var interactor: TableNewsDetailInputInteractor? {
    return super.baseInteractor as? TableNewsDetailInputInteractor
  }
  
}

// MARK: - HomeFilterPresenterProtocol
extension TableNewsDetailPresenter: TableNewsDetailPresenterProtocol {
  func viewDidLoad() {
    self.interactor?.getURLFromData()
  }
  
  func goBack() {
    self.router?.goBack()
  }
}

// MARK: - HomeFilterInteractorOutputProtocol
extension TableNewsDetailPresenter: TableNewsDetailInteractorOutputProtocol {
  func gotUrlString(url: String) {
    self.view?.setWebView(url: url)
  }
}
