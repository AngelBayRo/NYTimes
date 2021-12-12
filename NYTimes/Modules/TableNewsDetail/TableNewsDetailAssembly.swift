//
//  TableNewsDetailAssembly.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import UIKit

class TableNewsDetailAssembly: BaseAssembly {
  
  static func tableNewsDetailNavigationView(assemblyDTO: TableNewsDetailAssemblyDTO? = nil) -> UINavigationController {
    return UINavigationController(rootViewController: tableNewsDetailView(assemblyDTO: assemblyDTO))
  }
  
  static func tableNewsDetailView(assemblyDTO: TableNewsDetailAssemblyDTO? = nil) -> TableNewsDetailViewController {
    let view = TableNewsDetailViewController(nibName: "TableNewsDetailViewController", bundle: nil)
    
    let viper = BaseAssembly.assembly(baseView: view,
                                      presenter: TableNewsDetailPresenter.self,
                                      router: TableNewsDetailRouter.self,
                                      interactor: TableNewsDetailInteractor.self)
    viper.interactor.tableNewsDetailAssemblyDTO = assemblyDTO
    viper.interactor.provider = TableNewsDetailProvider()
    return view
  }
}

struct TableNewsDetailAssemblyDTO {
  let url: String
}
