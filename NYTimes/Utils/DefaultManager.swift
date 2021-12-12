//
//  DefaultManager.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation
import UIKit

class DefaultManager: NSObject {
  static func getBaseUrl() -> String {
    return "https://api.nytimes.com/svc/mostpopular/v2"
  }
  
  static func getAPIKey() -> String {
    return "2bB0BGGe2pysadVQorASzqyClBzI5w1G"
  }
  
  static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    var idx = items.startIndex
    let endIdx = items.endIndex
    
    repeat {
      Swift.print(items[idx], separator: separator, terminator: idx == (endIdx - 1) ? terminator : separator)
      idx += 1
    }
    while idx < endIdx
  }
}
