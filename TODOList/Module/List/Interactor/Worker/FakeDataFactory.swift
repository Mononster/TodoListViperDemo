//
//  FakeDataFactory.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/3/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import Foundation

final class FakeDataFactory {

  static let shared: FakeDataFactory = FakeDataFactory()

  private init() {

  }

  func generateTodoItems(offset: Int, limit: Int) -> [TodoItem] {
    var items: [TodoItem] = []
    for i in 0..<limit {
      items.append(TodoItem(content: "Test \(offset + i)"))
    }
    return items
  }
}
