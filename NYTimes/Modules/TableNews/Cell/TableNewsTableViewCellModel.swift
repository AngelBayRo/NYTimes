//
//  TableNewsTableViewCellModel.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

class TableNewsTableViewCellModel {
  var title, source, publishedDate, section, urlImage: String?
  
  init(model: ResultBusinessModel) {
    self.title = model.title
    self.source = model.source
    self.publishedDate = model.publishedDate
    self.section = model.section
    self.urlImage = model.urlImage
  }
}
