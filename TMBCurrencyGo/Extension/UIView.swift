//
//  UIView.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 2/2/2564 BE.
//

import Foundation

import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
        ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}
