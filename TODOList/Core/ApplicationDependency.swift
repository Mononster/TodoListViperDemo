//
//  ApplicationDependency.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import UIKit

final class ApplicationDependency {

  static let manager = ApplicationDependency()
  static var safeAreaPadding: CGFloat = 0

  lazy var coordinator: AppCoordinator = {
    let navigationController = UINavigationController()
    let router = Router(navigationController: navigationController)
    return AppCoordinator(navigationController: navigationController,
                          router: router)
  }()

  private init() {
    if #available(iOS 11.0, *) {
      ApplicationDependency.safeAreaPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
    }
  }
}
