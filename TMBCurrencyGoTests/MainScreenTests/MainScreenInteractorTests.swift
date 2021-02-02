//
//  MainScreenInteractorTests.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 2/2/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import Nimble
import Quick
@testable import TMBCurrencyGo

final class MainScreenInteractorTests: QuickSpec {
    override func spec() {
        describe("MainScreenInteractorTests") {
            var interactor: MainScreenInteractor!
            var presenter: MainScreenPresentationLogicSpy!
            var worker: MockMainScreenWorker!
            beforeEach {
                worker = MockMainScreenWorker()
                presenter = MainScreenPresentationLogicSpy()
                interactor = MainScreenInteractor(worker: worker)
                interactor.presenter = presenter
            }
            
            context("fetchAllCurrencly") {
                it("success") {
                    worker.isFail = false
                    interactor.fetchGetAllCurrency()
                    expect(presenter.allCurrencyResponse).toNot(beNil())
                }
                it("failed") {
                    worker.isFail = true
                    interactor.fetchGetAllCurrency()
                    expect(presenter.errorResponse).toNot(beNil())
                }
            }
            
            context("fetchConvertedCurrencly") {
                it("success") {
                    worker.isFail = false
                    interactor.fetchGetConvertCurrency(request: MainScreen.CovertedCurrencies.Request(amount: "10", from: "AED", to: "AFN"))
                    expect(presenter.covertedCurrencyResponse).toNot(beNil())
                }
                it("failed") {
                    worker.isFail = true
                    interactor.fetchGetConvertCurrency(request: MainScreen.CovertedCurrencies.Request(amount: "10", from: "AED", to: "AFN"))
                    expect(presenter.errorResponse).toNot(beNil())
                }
            }
            
            context("fetchConvertedCurrencly") {
                it("success") {
                    worker.isFail = false
                    interactor.fetchGetConvertCurrency(request: MainScreen.CovertedCurrencies.Request(amount: "10", from: "AED", to: "AFN"))
                    expect(presenter.covertedCurrencyResponse).toNot(beNil())
                }
                it("failed") {
                    worker.isFail = true
                    interactor.fetchGetConvertCurrency(request: MainScreen.CovertedCurrencies.Request(amount: "10", from: "AED", to: "AFN"))
                    expect(presenter.errorResponse).toNot(beNil())
                }
            }
            
            context("fetchRateddCurrencly") {
                it("success") {
                    worker.isFail = false
                    interactor.fetchGetRatesCurrency(allCurrency: [CurrencyData(shotCountry: "THB", longCountry: "Thailand", rateCountry: 33.0)], currencyDic: ["THB": "Thailand"])
                    expect(presenter.ratedCurrencyResponse).toNot(beNil())
                }
                it("failed") {
                    worker.isFail = true
                    interactor.fetchGetRatesCurrency(allCurrency: [CurrencyData(shotCountry: "THB", longCountry: "Thailand", rateCountry: 33.0)], currencyDic: ["THB": "Thailand"])
                    expect(presenter.errorResponse).toNot(beNil())
                }
            }
        }
    }
}

final class MainScreenPresentationLogicSpy: MainScreenPresentationLogic {
    var allCurrencyResponse: MainScreen.AllCurrencies.Response?
    var errorResponse: CurrencyErorrResponse?
    var covertedCurrencyResponse: MainScreen.CovertedCurrencies.Response?
    var ratedCurrencyResponse: MainScreen.RatesCurrencies.Response?
    func presentGetAllCurrency(response: MainScreen.AllCurrencies.Response) {
        switch response.result {
        case .success:
            allCurrencyResponse = response
        case .failure(let error):
            errorResponse = error
        }
    }
    
    func presentConvertCurrency(response: MainScreen.CovertedCurrencies.Response) {
        switch response.result {
        case .success:
            covertedCurrencyResponse = response
        case .failure(let error):
            errorResponse = error
        }
    }
    
    func presentGetRatesCurrency(response: MainScreen.RatesCurrencies.Response, allCurrency: [CurrencyData], currencyDic: [String: String]) {
        switch response.result {
        case .success:
            ratedCurrencyResponse = response
        case .failure(let error):
            errorResponse = error
        }
    }
}

class MockMainScreenWorker: MainScreenWorker {
    var isFail: Bool = false
    
    override func getCovertCurrency(amount: String, from: String, to: String, completion: @escaping (Result<CovertCurrencyResponse, CurrencyErorrResponse>) -> Void) {
        let mockobj = MockObject()
        if !isFail {
            completion(.success(mockobj.toGetCovertCurrencyResponse()))
        } else {
            completion(.failure(mockobj.toGetErrorCurrencyResponse()))
        }
    }
    
    override func getAllCurrency(completion: @escaping (Result<CurrencyResponse, CurrencyErorrResponse>) -> Void) {
        let mockobj = MockObject()
        if !isFail {
            completion(.success(mockobj.toGetAllCurrencyResponse()))
        } else {
            completion(.failure(mockobj.toGetErrorCurrencyResponse()))
        }
    }
    
    override func getRatesCurrency(completion: @escaping (Result<RatesCurrencyResponse, CurrencyErorrResponse>) -> Void) {
        let mockobj = MockObject()
        if !isFail {
            completion(.success(mockobj.toGetRatesResponseData()))
        } else {
            completion(.failure(mockobj.toGetErrorCurrencyResponse()))
        }
    }
}
