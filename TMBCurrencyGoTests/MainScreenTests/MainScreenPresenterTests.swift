//
//  MainScreenPresenterTests.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 2/2/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import Nimble
import Quick
@testable import TMBCurrencyGo

final class MainScreenPresenterTests: QuickSpec {
    override func spec() {
        describe("MainScreenPresenterTests") {
            var presenter: MainScreenPresenter!
            var viewController: MainScreenDisplayLogicSpy!
            
            beforeEach {
                presenter = MainScreenPresenter()
                viewController = MainScreenDisplayLogicSpy()
                presenter.viewController = viewController
            }
            
            context("displayAllCurrecy") {
                it("did displaySucess") {
                    presenter.presentGetAllCurrency(response: MainScreen.AllCurrencies.Response(result: .success(CurrencyResponse(valid: true, currencies: ["THB": "Thailand"]))))
                    expect(viewController.allCurrecyVM).notTo(beNil())
                }
                it("did displayErorr") {
                    presenter.presentGetAllCurrency(response: MainScreen.AllCurrencies.Response(result: .failure(CurrencyErorrResponse(valid: false, error: CurrencyErorrResponse.Error(code: 404, message: "Error")))))
                    expect(viewController.allCurrecyVM).to(beNil())
                    expect(viewController.error).toNot(beNil())
                }
            }
            
            context("displayConvertedCurrecy") {
                it("did displaySucess") {
                    presenter.presentConvertCurrency(response: MainScreen.CovertedCurrencies.Response(result: .success(CovertCurrencyResponse(valid: true, updated: 1000, conversion: CovertCurrencyResponse.Conversion(amount: 20.00, from: "USD", to: "THB", result: 20.0)))))
                    expect(viewController.covertedCurrecyVM).notTo(beNil())
                }
                it("did displayErorr") {
                    presenter.presentConvertCurrency(response: MainScreen.CovertedCurrencies.Response(result: .failure(CurrencyErorrResponse(valid: false, error: CurrencyErorrResponse.Error(code: 404, message: "error")))))
                    expect(viewController.covertedCurrecyVM).to(beNil())
                    expect(viewController.error).toNot(beNil())
                }
            }
            
            context("displayRatesdCurrecy") {
                it("did displaySucess") {
                    presenter.presentGetRatesCurrency(response: MainScreen.RatesCurrencies.Response(result: .success(RatesCurrencyResponse(valid: true, updated: 1000, base: "THB", rates: ["THB": 20.00]))), allCurrency: [], currencyDic: [:])
                    expect(viewController.ratesCurrecyVM).notTo(beNil())
                }
                it("did displayErorr") {
                    presenter.presentGetRatesCurrency(response: MainScreen.RatesCurrencies.Response(result: .failure(CurrencyErorrResponse(valid: false, error: CurrencyErorrResponse.Error(code: 404, message: "Error")))), allCurrency: [], currencyDic: [:])
                    expect(viewController.ratesCurrecyVM).to(beNil())
                    expect(viewController.error).toNot(beNil())
                }
            }
        }
    }
}

final class MainScreenDisplayLogicSpy: MainScreenDisplayLogic {
    var error: CurrencyErorrResponse?
    var allCurrecyVM: MainScreen.AllCurrencies.ViewModel?
    var covertedCurrecyVM: MainScreen.CovertedCurrencies.ViewModel?
    var ratesCurrecyVM: MainScreen.RatesCurrencies.ViewModel?
    func displayError(error: CurrencyErorrResponse) {
        self.error = error
    }
    
    func displayAllCurrency(viewModel: MainScreen.AllCurrencies.ViewModel, currencyDic: [String: String]) {
        allCurrecyVM = viewModel
    }
    
    func displayConvertCurrency(viewModel: MainScreen.CovertedCurrencies.ViewModel) {
        covertedCurrecyVM = viewModel
    }
    
    func displayRatesCurrency(viewModel: MainScreen.RatesCurrencies.ViewModel) {
        ratesCurrecyVM = viewModel
    }
}
