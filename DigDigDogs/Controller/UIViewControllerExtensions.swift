//
//  UIViewControllerExtensions.swift
//  DigDigDogs
//
//  Created by Angelina Olmedo on 3/18/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  static func instantiate() -> Self {
    return self.init(nibName: String(describing: self), bundle: nil)
  }
}

