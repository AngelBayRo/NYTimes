//
//  HomeFilterInteractor.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

protocol HomeFilterInputInteractor: BaseInteractorInputProtocol {
  func getNews(type: Types, time: String)
}

class HomeFilterInteractor: BaseInteractor {
  
  // MARK: VIPER Dependencies
  weak var presenter: HomeFilterInteractorOutputProtocol? {
    return super.basePresenter as? HomeFilterInteractorOutputProtocol
  }
  var homeFilterAssemblyDTO: HomeFilterAssemblyDTO?
  var provider: HomeFilterProviderProtocol?
}

// MARK: - HomeFilterInputInteractor
extension HomeFilterInteractor: HomeFilterInputInteractor {
  
  func getNews(type: Types, time: String) {
    let dto = HomeFilterProviderDTO(type: type,
                                    time: time)
    
    self.provider?.getNews(dto: dto, success: { serverModel in
      let businessModel = NewsDataBusinessModel(serverModel: serverModel?.results ?? [])
      
      self.presenter?.setFilteredContent(businessModel: businessModel)
    }, failure: {
      self.presenter?.showError()
    })
  }
}
