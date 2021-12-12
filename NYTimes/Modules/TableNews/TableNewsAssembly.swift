//
//  TableNewsAssembly.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import UIKit

class TableNewsAssembly: BaseAssembly {
  
  static func tableNewsNavigationView(assemblyDTO: TableNewsAssemblyDTO? = nil) -> UINavigationController {
    return UINavigationController(rootViewController: tableNewsView(assemblyDTO: assemblyDTO))
  }
  
  static func tableNewsView(assemblyDTO: TableNewsAssemblyDTO? = nil) -> TableNewsViewController {
    let view = TableNewsViewController(nibName: "TableNewsViewController", bundle: nil)
    
    let viper = BaseAssembly.assembly(baseView: view,
                                      presenter: TableNewsPresenter.self,
                                      router: TableNewsRouter.self,
                                      interactor: TableNewsInteractor.self)
    viper.interactor.tableNewsAssemblyDTO = assemblyDTO
    viper.interactor.provider = TableNewsProvider()
    return view
  }
}

struct TableNewsAssemblyDTO {
  let model: [ResultBusinessModel]
}
