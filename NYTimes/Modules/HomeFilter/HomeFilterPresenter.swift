//
//  HomeFilterPresenter.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

protocol HomeFilterPresenterProtocol: BasePresenterProtocol {
  func getDataNews(typeSelected: Int, timeSelected: String)
}

protocol HomeFilterInteractorOutputProtocol: BaseInteractorOutputProtocol {
  func setFilteredContent(businessModel: NewsDataBusinessModel)
  func showError()
}

class HomeFilterPresenter: BasePresenter {
  
  // MARK: VIPER Dependencies
  weak var view: HomeFilterViewProtocol? {
    return super.baseView as? HomeFilterViewProtocol
  }
  
  var router: HomeFilterRouterProtocol? {
    return super.baseRouter as? HomeFilterRouterProtocol
  }
  
  var interactor: HomeFilterInputInteractor? {
    return super.baseInteractor as? HomeFilterInputInteractor
  }
  
  var model: [ResultBusinessModel]?
}

// MARK: - HomeFilterPresenterProtocol
extension HomeFilterPresenter: HomeFilterPresenterProtocol {
  func viewDidLoad() {
    self.view?.disableSpinner()
  }
  
  func getDataNews(typeSelected: Int, timeSelected: String) {
    var type: Types = .mostMailed
    
    if typeSelected == 0 { type = .mostMailed }
    if typeSelected == 1 { type = .mostShared }
    if typeSelected == 2 { type = .mostViewed }
    
    self.interactor?.getNews(type: type, time: timeSelected)
  }
}

// MARK: - HomeFilterInteractorOutputProtocol
extension HomeFilterPresenter: HomeFilterInteractorOutputProtocol {
  
  func setFilteredContent(businessModel: NewsDataBusinessModel) {
    self.model = businessModel.results
    
    let dto = TableNewsAssemblyDTO(model: businessModel.results ?? [])
    
    self.view?.disableSpinner()
    self.router?.goToTableNews(tableData: dto)
  }
  
  func showError() {
    let message = "No hay datos!"
    
    self.router?.showAlert(message: message)
  }
}
