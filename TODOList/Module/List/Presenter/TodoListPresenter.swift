//
//  TodoListPresenter.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import Foundation

final class TodoListPresenter {

  weak var view: TodoListViewInput?
  weak var router: TodoListRouterInput?

  private let interactor: TodoListInteractorInput
  private var state: TodoListState

  init(view: TodoListViewInput,
       interactor: TodoListInteractorInput,
       state: TodoListState) {
    self.view = view
    self.interactor = interactor
    self.state = state
  }
}

extension TodoListPresenter: TodoListViewOutput {

  func readyToPresent() {
    guard let view = view else {
      return
    }
    view.setupIntialState()
    self.interactor.loadTodoListPresentingModels(fetchOffset: state.pagination.currentOffset,
                                                 fetchLimit: state.pagination.fetchLimit)
  }

  func loadMoreData() {
    guard !self.state.isLoadingMoreData else {
      return
    }
    self.state.isLoadingMoreData = true
    self.view?.dataSource?.startLoadingState()
    self.interactor.loadTodoListPresentingModels(fetchOffset: state.pagination.currentOffset,
                                                 fetchLimit: state.pagination.fetchLimit)
  }
}

extension TodoListPresenter: TodoListInteractorOutput {

  func didObtain(presentingModels: [TodoItemPresentingModel], serverOffset: Int) {
    self.state.isLoadingMoreData = false
    self.state.pagination.currentOffset = serverOffset
    self.view?.dataSource?.update(models: presentingModels, animate: true)
  }
}
