//
//  MainScreenModels.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum MainScreen {
    // MARK: Use cases

    enum AllCurrencies {
        struct Request {}

        struct Response {
            var result: Result<CurrencyResponse, CurrencyErorrResponse>
        }

        struct ViewModel {
            var result: [CurrencyData]?
            var errorResult: CurrencyErorrResponse?
        }
    }

    enum CovertedCurrencies {
        struct Request {
            let amount: String
            let from: String
            let to: String
        }

        struct Response {
            var result: Result<CovertCurrencyResponse, CurrencyErorrResponse>
        }

        struct ViewModel {
            var result: CovertCurrencyResponse?
            var errorResult: CurrencyErorrResponse?
        }
    }

    enum RatesCurrencies {
        struct Request {}

        struct Response {
            var result: Result<RatesCurrencyResponse, CurrencyErorrResponse>
        }

        struct ViewModel {
            var result: [CurrencyData]?
            var errorResult: CurrencyErorrResponse?
        }
    }
}
