//
//  Extension+UIView.swift
//  CustomVideo
//
//  Created by Dat Bui on 7/7/20.
//  Copyright © 2020 Dat Bui. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  @IBInspectable
  var viewCornerRadius: CGFloat {
    get {
      return self.layer.cornerRadius
    }
    set {
      self.layer.cornerRadius = newValue
    }
  }
}

extension UIView {
  func fullBorderShadow(radius: CGFloat, offSet: CGSize, opacity: Float, color: UIColor) {
    
    self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.viewCornerRadius).cgPath
    self.layer.shadowRadius = radius
    self.layer.shadowOffset = offSet
    self.layer.shadowOpacity = opacity
    self.layer.shadowColor = color.cgColor
  }
}
