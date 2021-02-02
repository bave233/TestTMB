//
//  CurrencyTableViewCellSnapShotTests.swift
//  TMBCurrencyGoTests
//
//  Created by Ratchanon.Int on 2/2/2564 BE.
//

import FBSnapshotTestCase
import Foundation

@testable import TMBCurrencyGo
import XCTest

final class ShopLocationTextFieldTableViewCellSnapshotTest: FBSnapshotTestCase {
    var cell: CurrencyTableViewCell!
    override func setUp() {
        super.setUp()
        setupUI()
    }

    private func setupUI() {
        cell = CurrencyTableViewCell.loadFromNibNamed(nibNamed: "CurrencyTableViewCell") as? CurrencyTableViewCell
    }

    func testRenderShopLocationTextFieldTableViewCell() {
        cell.frame = CGRect(x: 0, y: 0, width: 395, height: 167)
        cell.setupUI(model: CurrencyTableViewCell.CurrencyCellModel(title: "Hi", row: 100, subtitle: "Sub", content: "Content", subcontent: "SubContent", imageString: ""))
        snapshotVerifyView(cell)
    }

    override func tearDown() {
        super.tearDown()
        cell = nil
    }
}


public extension FBSnapshotTestCase {
  
    func snapshotVerifyView(_ view: UIView,
                               tolerance: CGFloat = 1.0,
                                    file: StaticString = #file,
                                    line: UInt = #line) {
    FBSnapshotVerifyView(
      view,
      identifier: "",
      suffixes: NSOrderedSet(array: [""]),
      overallTolerance: tolerance,
      file: file,
      line: line
    )
  }
}



