//
//  TodoItemCell.swift
//  TODOList
//
//  Created by Marvin Zhan on 10/3/18.
//  Copyright © 2018 Tengqi Zhan. All rights reserved.
//

import UIKit
import SnapKit

final class TodoItemCell: UICollectionViewCell {

  private let itemTitleLabel: UILabel
  private let separator: UIView

  static let height: CGFloat = 50

  override init(frame: CGRect) {
    itemTitleLabel = UILabel()
    separator = UIView()
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupCell(title: String) {
    self.itemTitleLabel.text = title
  }
}

extension TodoItemCell {

  private func setupUI() {
    setupItemLabel()
    setupSeparator()
    setupConstraints()
  }

  private func setupItemLabel() {
    addSubview(itemTitleLabel)
    itemTitleLabel.textColor = .darkGray
    itemTitleLabel.font = UIFont.systemFont(ofSize: 17)
    itemTitleLabel.textAlignment = .natural
    itemTitleLabel.adjustsFontSizeToFitWidth = true
    itemTitleLabel.minimumScaleFactor = 0.5
    itemTitleLabel.numberOfLines = 1
  }

  private func setupSeparator() {
    addSubview(separator)
    separator.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
  }

  private func setupConstraints() {
    itemTitleLabel.snp.makeConstraints { (make) in
      make.leading.equalToSuperview().offset(24)
      make.top.bottom.equalToSuperview()
      make.trailing.equalToSuperview()
    }

    separator.snp.makeConstraints { (make) in
      make.bottom.trailing.equalToSuperview()
      make.leading.equalToSuperview().offset(24)
      make.height.equalTo(0.5)
    }
  }
}
