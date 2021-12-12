//
//  TableNewsPresenter.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation
import UIKit

protocol TableNewsPresenterProtocol: BasePresenterProtocol {
  func getDataCount() -> Int
  func getDataElement(position: Int) -> ResultBusinessModel
  func goToDetail(position: Int)
  func goBack()
}

protocol TableNewsInteractorOutputProtocol: BaseInteractorOutputProtocol {
  func setDataContent(response: [ResultBusinessModel])
}

class TableNewsPresenter: BasePresenter {
  
  // MARK: VIPER Dependencies
  weak var view: TableNewsViewProtocol? {
    return super.baseView as? TableNewsViewProtocol
  }
  
  var router: TableNewsRouterProtocol? {
    return super.baseRouter as? TableNewsRouterProtocol
  }
  
  var interactor: TableNewsInputInteractor? {
    return super.baseInteractor as? TableNewsInputInteractor
  }
  
  var model: [ResultBusinessModel]?
}

// MARK: - TableNewsPresenterProtocol
extension TableNewsPresenter: TableNewsPresenterProtocol {
  
  func viewDidLoad() {
    self.interactor?.getTableData()
  }
  
  func getDataCount() -> Int {
    return model?.count ?? 0
  }
  
  func getDataElement(position: Int) -> ResultBusinessModel {
    guard let data = model else {
      return ResultBusinessModel()
    }
    
    return data[position]
  }
  
  func goToDetail(position: Int) {
    guard let data = model?[position] else {
      return
    }
    
    let dto = TableNewsDetailAssemblyDTO(url: data.urlContent ?? "")
    
    router?.goToTableNewsDetail(detailData: dto)
  }
  
  func goBack() {
    self.router?.goBack()
  }
}

// MARK: - TableNewsInteractorOutputProtocol
extension TableNewsPresenter: TableNewsInteractorOutputProtocol {
  
  func setDataContent(response: [ResultBusinessModel]) {
    self.model = response
    
    self.view?.reloadTable()
  }
}
