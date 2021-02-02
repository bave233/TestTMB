//
//  MainScreenRouter.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol MainScreenRoutingLogic {}

class MainScreenRouter: NSObject, MainScreenRoutingLogic {
    weak var viewController: MainScreenViewController?
}
