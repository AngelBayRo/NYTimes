//
//  HomeFilterProvider.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation
import Alamofire
import Lottie

protocol HomeFilterProviderProtocol: AnyObject {
  func getNews(dto: HomeFilterProviderDTO, success: @escaping (NewsData?) -> Void, failure: @escaping () -> Void)
  
}

final class HomeFilterProvider: HomeFilterProviderProtocol {
  
  func getNews(dto: HomeFilterProviderDTO, success: @escaping (NewsData?) -> Void, failure: @escaping () -> Void) {
    var endpointEnd = "\(HomeFilterProviderConstants.HomeFilterProviderPeriodRequest.endpoint)"
    
    guard let type = dto.type?.rawValue, let period = dto.time else {
      return
    }
    
    endpointEnd = endpointEnd.replacingOccurrences(of: "{type}", with: type, options: .literal, range: nil)
    
    endpointEnd = endpointEnd.replacingOccurrences(of: "{period}", with: period, options: .literal, range: nil)
    
    let baseURL = DefaultManager.getBaseUrl()
    let endpoint = "\(baseURL)\(endpointEnd)" + "?api-key=" + DefaultManager.getAPIKey()
    
    AF.request(endpoint)
      .validate()
      .responseDecodable(of: NewsData.self) { (response) in
        guard let newsData = response.value else {
          failure()
          return
        }
        success(newsData)
      }
  }
  
}

private struct HomeFilterProviderConstants {
  struct HomeFilterProviderPeriodRequest {
    static let endpoint: String = "/{type}/{period}.json"
    static let method: HTTPMethod = .get
  }
}

struct HomeFilterProviderDTO {
  let type: Types?
  let time: String?
}

enum Types: String {
  case mostMailed = "emailed"
  case mostShared = "shared"
  case mostViewed = "viewed"
}
