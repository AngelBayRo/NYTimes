//
//  HomeFilterServerModel.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
  let status: String
  let copyright: String
  let numResults: Int
  let results: [Result]
  
  enum CodingKeys: String, CodingKey {
    case status
    case copyright
    case numResults = "num_results"
    case results
  }
}

// MARK: - Result
struct Result: Codable {
  let title: String
  let source: String
  let publishedDate: String
  let section: String
  let url: String
  let media: [Media]
  
  enum CodingKeys: String, CodingKey {
    case url
    case source
    case publishedDate = "published_date"
    case section
    case title
    case media
  }
}

// MARK: - Media
struct Media: Codable {
  let type: String
  let subtype: String
  let caption: String
  let copyright: String
  let approvedForSyndication: Int
  let mediaMetadata: [MediaMetadatum]
  
  enum CodingKeys: String, CodingKey {
    case type
    case subtype
    case caption
    case copyright
    case approvedForSyndication = "approved_for_syndication"
    case mediaMetadata = "media-metadata"
  }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
  let url: String
  let format: String
  let height: Int
  let width: Int
}
