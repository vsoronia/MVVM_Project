//
//  ThemeManager.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 14/3/24.
//

import Foundation

struct ThemeManager {

  static var shared = ThemeManager()

  private init() {
    colors = ColorManager()
  }

  let colors: ColorManager
}






