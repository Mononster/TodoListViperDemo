//
//  AppCoordinator.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {

  let router: Router
  let navigationController: UINavigationController

  private var appTracker = AppTracker()
  var coordinators: [Coordinator] = []

  init(navigationController: UINavigationController,
       router: Router) {
    self.router = router
    self.navigationController = navigationController
  }

  func start(window: UIWindow) {
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
    appTracker.start()
    show()
  }

  func show() {
    showContents()
  }

  func showContents() {
    let coordinator = TodoListCoordinator(rootViewController: TodoListViewController(), router: router)
    coordinator.start()
    addCoordinator(coordinator)
    self.router.setRootModule(coordinator.toPresentable())
  }
}

extension AppCoordinator {
  func toPresentable() -> UIViewController {
    return self.router.navigationController
  }
}
