//
//  String.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//

import Foundation
extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
