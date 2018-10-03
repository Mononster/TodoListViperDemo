//
//  TodoListInteractorInput.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import IGListKit

protocol TodoListInteractorInput: class {

  func loadTodoListPresentingModels(fetchOffset: Int, fetchLimit: Int)
}

