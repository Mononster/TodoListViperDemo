//
//  TodoListCoordinator.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import UIKit

final class TodoListCoordinator: Coordinator {

  let router: Router
  var coordinators: [Coordinator] = []
  let rootViewController: TodoListViewController

  init(rootViewController: TodoListViewController, router: Router) {
    self.router = router
    self.rootViewController = rootViewController
  }

  func assemblyModule() {
    let interactor = TodoListInteractor()
    let presenter = TodoListPresenter(view: rootViewController,
                                      interactor: interactor,
                                      state: TodoListState())
    presenter.router = self
    rootViewController.output = presenter
    interactor.output = presenter
  }

  func start() {
    assemblyModule()
  }

  func toPresentable() -> UIViewController {
    return self.rootViewController
  }
}

extension TodoListCoordinator: TodoListRouterInput {

  func showDetailTodoItem() {

  }
}
