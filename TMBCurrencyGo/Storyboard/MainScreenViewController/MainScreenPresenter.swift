//
//  MainScreenPresenter.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol MainScreenPresentationLogic {
    func presentGetAllCurrency(response: MainScreen.AllCurrencies.Response)
    func presentConvertCurrency(response: MainScreen.CovertedCurrencies.Response)
    func presentGetRatesCurrency(response: MainScreen.RatesCurrencies.Response, allCurrency: [CurrencyData], currencyDic: [String: String])
}

class MainScreenPresenter: MainScreenPresentationLogic {
    weak var viewController: MainScreenDisplayLogic?

    func presentGetAllCurrency(response: MainScreen.AllCurrencies.Response) {
        switch response.result {
        case .success(let data):
            if let mData = data.currencies {
                var newObjArray: [CurrencyData] = []
                for obj in mData {
                    newObjArray.append(CurrencyData(shotCountry: obj.key, longCountry: obj.value, rateCountry: 0.0))
                }
                let viewModel = MainScreen.AllCurrencies.ViewModel(result: newObjArray)
                viewController?.displayAllCurrency(viewModel: viewModel, currencyDic: mData)
            } else {
                viewController?.displayError(error: CurrencyErorrResponse(valid: false, error: CurrencyErorrResponse.Error(code: 998, message: "ObjError")))
            }
        case .failure(let error):
            viewController?.displayError(error: error)
        }
    }

    func presentConvertCurrency(response: MainScreen.CovertedCurrencies.Response) {
        switch response.result {
        case .success(let data):
            let viewModel = MainScreen.CovertedCurrencies.ViewModel(result: data)
            viewController?.displayConvertCurrency(viewModel: viewModel)
        case .failure(let error):
            viewController?.displayError(error: error)
        }
    }

    func presentGetRatesCurrency(response: MainScreen.RatesCurrencies.Response, allCurrency: [CurrencyData], currencyDic: [String: String]) {
        switch response.result {
        case .success(let data):
            if let mData = data.rates {
                var newObjArray: [CurrencyData] = []
                for rates in mData {
                    for currecy in allCurrency {
                        if currecy.shotCountry == rates.key {
                            newObjArray.append(CurrencyData(shotCountry: rates.key, longCountry: currecy.longCountry, rateCountry: rates.value))
                        }
                    }
                }
                let viewModel = MainScreen.RatesCurrencies.ViewModel(result: newObjArray)
                viewController?.displayRatesCurrency(viewModel: viewModel)
            } else {
                viewController?.displayError(error: CurrencyErorrResponse(valid: false, error: CurrencyErorrResponse.Error(code: 998, message: "ObjError")))
            }
        case .failure(let error):
            viewController?.displayError(error: error)
        }
    }
}
