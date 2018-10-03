//
//  TodoListInteractor.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import IGListKit

final class TodoListInteractor {

  weak var output: TodoListInteractorOutput?

  private var presentingModels: [TodoItemPresentingModel] = []
  private let dataWorker: TodoListDataWorker

  init() {
    dataWorker = TodoListDataWorker()
  }
}

extension TodoListInteractor: TodoListInteractorInput {

  func loadTodoListPresentingModels(fetchOffset: Int, fetchLimit: Int) {
    dataWorker.fetchTodos(fetchOffset: fetchOffset, fetchLimit: fetchLimit) { (todos, serverOffset) in
      let contents = todos.map { todo in
        return TodoItemPresentingModel(item: todo.content)
      }
      self.presentingModels.append(contentsOf: contents)
      self.output?.didObtain(presentingModels: self.presentingModels,
                             serverOffset: serverOffset)
    }
  }
}
