//
//  HomeFilterAssembly.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import UIKit

class HomeFilterAssembly: BaseAssembly {
  
  static func homeFilterNavigationView(assemblyDTO: HomeFilterAssemblyDTO? = nil) -> UINavigationController {
    return UINavigationController(rootViewController: homeFilterView(assemblyDTO: assemblyDTO))
  }
  
  static func homeFilterView(assemblyDTO: HomeFilterAssemblyDTO? = nil) -> HomeFilterViewController {
    let view = HomeFilterViewController(nibName: "HomeFilterViewController", bundle: nil)
    
    let viper = BaseAssembly.assembly(baseView: view,
                                      presenter: HomeFilterPresenter.self,
                                      router: HomeFilterRouter.self,
                                      interactor: HomeFilterInteractor.self)
    viper.interactor.homeFilterAssemblyDTO = assemblyDTO
    viper.interactor.provider = HomeFilterProvider()
    return view
  }
}

struct HomeFilterAssemblyDTO {
  
}
