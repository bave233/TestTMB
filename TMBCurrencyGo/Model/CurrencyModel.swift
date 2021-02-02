//
//  CurrencyModel.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//

import Foundation

// MARK: - CurrencyResponse

struct CurrencyResponse: Codable {
    var valid: Bool?
    var currencies: [String: String]?

    enum CodingKeys: String, CodingKey {
        case valid
        case currencies
    }
}

struct CurrencyData: Hashable {
    var shotCountry: String
    var longCountry: String
    var rateCountry: Double
}

struct RateData {
    let name: String
    let value: Double
}

// MARK: - RatesResponse

struct RatesCurrencyResponse: Codable {
    var valid: Bool?
    var updated: Int?
    var base: String?
    var rates: [String: Double]?

    enum CodingKeys: String, CodingKey {
        case valid
        case updated
        case base
        case rates
    }
}

// MARK: - CovertCurrencyResponse

struct CovertCurrencyResponse: Codable {
    var valid: Bool?
    var updated: Int?
    var conversion: Conversion?

    enum CodingKeys: String, CodingKey {
        case valid
        case updated
        case conversion
    }

    // MARK: - Conversion

    struct Conversion: Codable {
        var amount: Double?
        var from: String?
        var to: String?
        var result: Double?

        enum CodingKeys: String, CodingKey {
            case amount
            case from
            case to
            case result
        }
    }
}

// MARK: - CurrencyErorrResponse

struct CurrencyErorrResponse: Codable, Error {
    var valid: Bool?
    var error: Error?

    enum CodingKeys: String, CodingKey {
        case valid
        case error
    }

    // MARK: - Error

    struct Error: Codable {
        var code: Int?
        var message: String?

        enum CodingKeys: String, CodingKey {
            case code
            case message
        }
    }
}
