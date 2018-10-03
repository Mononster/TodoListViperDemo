//
//  TodoListInteractorOutput.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

protocol TodoListInteractorOutput: class {

  func didObtain(presentingModels: [TodoItemPresentingModel], serverOffset: Int)
}

