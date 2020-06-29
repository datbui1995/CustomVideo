//
//  CustomNavigationViewController.swift
//  CustomVideo
//
//  Created by Dat Bui on 6/30/20.
//  Copyright © 2020 Dat Bui. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func makeTransparent() {
    self.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationBar.shadowImage = UIImage()
    self.navigationBar.isTranslucent = true
    self.view.backgroundColor = .clear
  }
}
