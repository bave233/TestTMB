//
//  MainScreenInteractor.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

protocol MainScreenBusinessLogic {
    func fetchGetAllCurrency()
    func fetchGetConvertCurrency(request: MainScreen.CovertedCurrencies.Request)
    func fetchGetRatesCurrency(allCurrency: [CurrencyData], currencyDic: [String: String])
}

class MainScreenInteractor: MainScreenBusinessLogic {
    var presenter: MainScreenPresentationLogic?
    var worker: MainScreenWorker?

    init(worker: MainScreenWorker = MainScreenWorker()) {
        self.worker = worker
    }

    func fetchGetAllCurrency() {
        worker?.getAllCurrency(completion: { [weak self] result in
            let response = MainScreen.AllCurrencies.Response(result: result)
            self?.presenter?.presentGetAllCurrency(response: response)
        })
    }

    func fetchGetConvertCurrency(request: MainScreen.CovertedCurrencies.Request) {
        worker?.getCovertCurrency(amount: request.amount, from: request.from, to: request.to, completion: { [weak self] result in
            let response = MainScreen.CovertedCurrencies.Response(result: result)
            self?.presenter?.presentConvertCurrency(response: response)
        })
    }

    func fetchGetRatesCurrency(allCurrency: [CurrencyData], currencyDic: [String: String]) {
        worker?.getRatesCurrency(completion: { [weak self] result in
            let response = MainScreen.RatesCurrencies.Response(result: result)
            self?.presenter?.presentGetRatesCurrency(response: response, allCurrency: allCurrency, currencyDic: currencyDic)
        })
    }
}
