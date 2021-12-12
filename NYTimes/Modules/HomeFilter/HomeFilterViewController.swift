//
//  HomeFilterViewController.swift
//  NYTimes
//
//  Created by angel.bayon on 8/12/21.
//

import UIKit
import Lottie

protocol HomeFilterViewProtocol: BaseViewProtocol {
  func disableSpinner()
}

class HomeFilterViewController: BaseView {
  
  // MARK: VIPER Dependencies
  var presenter: HomeFilterPresenterProtocol? {
    return super.basePresenter as? HomeFilterPresenterProtocol
  }
  @IBOutlet weak var searchButton: UIButton!
  @IBOutlet weak var typeSelector: UISegmentedControl!
  @IBOutlet weak var timeSelector: UISegmentedControl!
  
  var selectedTypeTitle: Int?
  var selectedTime: String?

  private var animationView: AnimationView?

  override func viewDidLoad() {
    super.viewDidLoad()

    self.initateAnimation()

    self.presenter?.viewDidLoad()
  }
  
  @IBAction func searchAction(_ sender: Any) {
    initateAnimation()
    
    selectedTypeTitle = typeSelector.selectedSegmentIndex
    let periods = timeSelector.titleForSegment(at: typeSelector.selectedSegmentIndex)?.split(separator: " ")
    
    selectedTime = String(periods?.first ?? "")
    
    guard let selectedTypeTitle = selectedTypeTitle, let selectedTime = selectedTime else {
      return
    }
    
    self.presenter?.getDataNews(typeSelected: selectedTypeTitle, timeSelected: selectedTime)
  }

  func initateAnimation() {
    animationView = .init(name: "88688-loading-cyan-violet")
    animationView!.frame = view.bounds

    animationView?.contentMode = .scaleAspectFit
    animationView?.loopMode = .loop
    animationView?.animationSpeed = 1

    view.addSubview(animationView!)

    animationView?.play()
  }

  func closeAnimate() {
    UIView.animate(withDuration: 1, animations: {
      self.animationView?.alpha = 0
    }, completion: { _ in })
  }
}

// MARK: - HomeFilterViewProtocol
extension HomeFilterViewController: HomeFilterViewProtocol {
  
  func disableSpinner() {
    closeAnimate()
  }
}
