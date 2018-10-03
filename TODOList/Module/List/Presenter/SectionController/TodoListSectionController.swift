//
//  TodoListSectionController.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/3/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import IGListKit

final class TodoItemPresentingModel: NSObject, ListDiffable {

  var item: String

  init(item: String) {
    self.item = item
  }

  func diffIdentifier() -> NSObjectProtocol {
    return self
  }

  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return true
  }
}

final class TodoListSectionController: ListSectionController {

  private var model: TodoItemPresentingModel?

  override func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: collectionContext?.containerSize.width ?? 0,
                  height: TodoItemCell.height)
  }

  override func numberOfItems() -> Int {
    return 1
  }

  override func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(of: TodoItemCell.self, for: self, at: index) as? TodoItemCell, let model = model else {
      fatalError()
    }
    cell.setupCell(title: model.item)
    return cell
  }

  override func didUpdate(to object: Any) {
    model = object as? TodoItemPresentingModel
  }
}
