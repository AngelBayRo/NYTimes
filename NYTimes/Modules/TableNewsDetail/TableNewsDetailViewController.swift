//
//  TableNewsDetailViewController.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//  

import UIKit
import WebKit

protocol TableNewsDetailViewProtocol: BaseViewProtocol {
  func setWebView(url: String)
}

class TableNewsDetailViewController: BaseView {
  
  // MARK: VIPER Dependencies
  var presenter: TableNewsDetailPresenterProtocol? {
    return super.basePresenter as? TableNewsDetailPresenterProtocol
  }
  
  @IBOutlet weak var webView: WKWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.presenter?.viewDidLoad()
  }
  
  @IBAction func goBackAction(_ sender: Any) {
    self.presenter?.goBack()
  }
}

// MARK: - TableNewsDetailViewProtocol
extension TableNewsDetailViewController: TableNewsDetailViewProtocol {
  func setWebView(url: String) {
    let myURL = URL(string: url)
    let myRequest = URLRequest(url: myURL ?? URL(fileURLWithPath: ""))
    
    webView.load(myRequest)
  }
}

// MARK: - WKUIDelegate
extension TableNewsDetailViewController: WKUIDelegate {
  
}
