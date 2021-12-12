//
//  TableNewsViewController.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import UIKit

protocol TableNewsViewProtocol: BaseViewProtocol {
  func reloadTable()
}

class TableNewsViewController: BaseView {
  
  // MARK: VIPER Dependencies
  var presenter: TableNewsPresenterProtocol? {
    return super.basePresenter as? TableNewsPresenterProtocol
  }
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UINib.init(nibName: "TableNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "TableNewsTableViewCell")
    
    tableView.dataSource = self
    tableView.delegate = self
    
    self.presenter?.viewDidLoad()
  }
  
  @IBAction func goBackAction(_ sender: Any) {
    self.presenter?.goBack()
  }
}

// MARK: - TableNewsViewProtocol
extension TableNewsViewController: TableNewsViewProtocol {
  func reloadTable() {
    self.tableView.reloadData()
  }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension TableNewsViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.presenter?.getDataCount() ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let dataCell = self.presenter?.getDataElement(position: indexPath.row) else {
      return UITableViewCell()
    }
    
    let cellModel = TableNewsTableViewCellModel(model: dataCell)
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableNewsTableViewCell", for: indexPath) as? TableNewsTableViewCell ?? TableNewsTableViewCell()
    
    cell.configure(cellModel: cellModel)
    
    cell.selectionStyle = .none
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.presenter?.goToDetail(position: indexPath.row)
  }
}
