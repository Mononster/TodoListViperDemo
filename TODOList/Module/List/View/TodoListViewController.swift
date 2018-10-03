//
//  TodoListViewController.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/2/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import UIKit

final class TodoListViewController: BaseViewController {

  var output: TodoListViewOutput?
  var dataSource: TodoListDataSource?

  private let collectionView: UICollectionView

  override init() {
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    super.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    output?.readyToPresent()
  }
}

extension TodoListViewController: TodoListViewInput {

  func setupIntialState() {
    setupUI()
    setupDataSource()
  }

  private func setupDataSource() {
    dataSource = TodoListDataSource(view: self, collectionView: collectionView)
    dataSource?.adapter.scrollViewDelegate = self
  }

  private func setupUI() {
    self.navigationItem.title = "Viper+IGListKit"
    setupCollectionView()
    setupConstratints()
  }

  private func setupCollectionView() {
    self.view.addSubview(collectionView)
    collectionView.backgroundColor = .white
    collectionView.alwaysBounceVertical = true
  }

  private func setupConstratints() {
    collectionView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
  }
}

extension TodoListViewController: UIScrollViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                 withVelocity velocity: CGPoint,
                                 targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
    if distance < 100 {
      output?.loadMoreData()
    }
  }
}
