//
//  TodoListState.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import Foundation

struct TodoListState {

  struct Pagination {
    var currentOffset: Int = 0
    var fetchLimit: Int = 30
  }

  var pagination = Pagination()

  var isLoadingMoreData: Bool = false
}
