//
//  Extension+ViewController.swift
//  CustomVideo
//
//  Created by Dat Bui on 6/30/20.
//  Copyright © 2020 Dat Bui. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  static func initFromNib() -> Self {
    func instantiateFromNib<T: UIViewController>() -> T {
      return T.init(nibName: String(describing: T.self), bundle: nil)
    }
    return instantiateFromNib()
  }
}
