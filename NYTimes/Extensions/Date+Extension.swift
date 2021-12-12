//
//  Date+Extension.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

extension Date {
  func format(format: String) -> String {
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = format
    
    return dateFormatter.string(from: self)
  }
}
