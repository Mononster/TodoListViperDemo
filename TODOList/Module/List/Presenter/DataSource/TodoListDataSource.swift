//
//  TodoListDataSource.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/3/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import IGListKit
import UIKit

protocol TodoListDataSourceType {
  func update(models: [ListDiffable], animate: Bool)
  func startLoadingState()
}

final class TodoListDataSource: NSObject, TodoListDataSourceType {

  let adapter: ListAdapter
  private var sectionData: [ListDiffable] = []
  private let spinToken = "spinner"

  init(view: UIViewController,
       collectionView: UICollectionView) {
    adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: view)
    super.init()
    adapter.collectionView = collectionView
    adapter.dataSource = self
  }

  func update(models: [ListDiffable], animate: Bool) {
    self.sectionData = models
    self.adapter.performUpdates(animated: animate, completion: nil)
  }

  func startLoadingState() {
    self.sectionData.append(spinToken as ListDiffable)
    self.adapter.performUpdates(animated: true, completion: nil)
  }
}

extension TodoListDataSource: ListAdapterDataSource {

  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return sectionData
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    if let object = object as? String, object == spinToken {
      return spinnerSectionController()
    }
    return TodoListSectionController()
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}
