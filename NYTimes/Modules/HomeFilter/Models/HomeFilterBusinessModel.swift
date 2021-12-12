//
//  HomeFilterBusinessModel.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

// MARK: - NewsData
class NewsDataBusinessModel {
  var results: [ResultBusinessModel]?
  
  init() {
    results = []
  }
  
  init(serverModel: [Result]) {
    results = serverModel.map({
      ResultBusinessModel(serverModel: $0)
    })
  }
}

// MARK: - Result
class ResultBusinessModel {
  var title, source, publishedDate, section, urlImage, urlContent: String?
  
  init() {}
  
  init(serverModel: Result) {
    self.title = serverModel.title
    self.source = serverModel.source
    self.publishedDate = serverModel.publishedDate
    self.section = serverModel.section
    self.urlImage = serverModel.media.first(where: {
      $0.type.elementsEqual("image")
    })?.mediaMetadata.first?.url
    self.urlContent = serverModel.url
  }
}
