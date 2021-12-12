//
//  TableNewsTableViewCell.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import UIKit
import Alamofire

class TableNewsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var imageNews: UIImageView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var sectionLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  
  var model: TableNewsTableViewCellModel?
  var imageData: Data?
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    self.imageNews.image = UIImage()
  }
  
  func configure(cellModel: TableNewsTableViewCellModel) {
    self.model = cellModel
    self.dateLabel.text = cellModel.publishedDate
    self.sectionLabel.text = cellModel.section
    self.titleLabel.text = cellModel.title
    self.authorLabel.text = cellModel.source
    self.getImage()
  }
  
  func getImage() {
    guard let urlImage = model?.urlImage else {
      return
    }
    
    AF.request( urlImage, method: .get).response { response in
      switch response.result {
      case .success(let responseData):
        self.imageData = responseData
        self.imageNews.image = UIImage(data: responseData ?? Data())
        
      case .failure(let error):
        print("error--->",error)
      }
    }
  }
}
