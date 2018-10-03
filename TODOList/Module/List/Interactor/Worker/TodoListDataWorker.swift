//
//  TodoListDataWorker.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/3/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import UIKit

final class TodoListDataWorker {

  func fetchTodos(fetchOffset: Int,
                  fetchLimit: Int,
                  completion: @escaping ([TodoItem], Int) -> ()) {
    // Simulate fetching from network
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      let items = FakeDataFactory.shared.generateTodoItems(offset: fetchOffset, limit: fetchLimit)
      completion(items, fetchOffset + fetchLimit)
    }
  }
}
