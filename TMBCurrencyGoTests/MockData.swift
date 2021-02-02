//
//  MockData.swift
//  TMBCurrencyGoTests
//
//  Created by Ratchanon.Int on 2/2/2564 BE.
//

import Foundation
@testable import TMBCurrencyGo
class MockObject {
     var GetAllCurrencyResponseData: Data {
        return """
              {  "valid": true,
                  "currencies": {
                      "AED": "United Arab Emirates Dirham",
                      "AFN": "Afghan Afghani",
                      "ALL": "Albanian Lek",
                      "AMD": "Armenian Dram",
                      "ANG": "Netherlands Antillean Guilder",
                      "AOA": "Angolan Kwanza",
                      "ARS": "Argentine Peso",
                      "AUD": "Australian Dollar",
                      "AWG": "Aruban Florin",
                      "AZN": "Azerbaijani Manat",
                      "BAM": "Bosnia-Herzegovina Convertible Mark",
                      "BBD": "Barbadian Dollar",
                      "BCH": "Bitcoin Cash",
                      "BDT": "Bangladeshi Taka",
                      "BGN": "Bulgarian Lev",
                      "BHD": "Bahraini Dinar",
                      "BIF": "Burundian Franc",
                      "BMD": "Bermudan Dollar",
                      "BND": "Brunei Dollar",
                      "BOB": "Bolivian Boliviano",
                      "BRL": "Brazilian Real",
                      "BSD": "Bahamian Dollar",
                      "BTC": "Bitcoin",
                      "BTG": "Bitcoin Gold",
                      "BWP": "Botswanan Pula",
                      "BZD": "Belize Dollar",
                      "CAD": "Canadian Dollar",
                      "CDF": "Congolese Franc",
                      "CHF": "Swiss Franc",
                      "CLP": "Chilean Peso",
                      "CNH": "Chinese Yuan (offshore)",
                      "CNY": "Chinese Yuan",
                      "COP": "Colombian Peso",
                      "CRC": "Costa Rican Colón",
                      "CUC": "Cuban Convertible Peso",
                      "CUP": "Cuban Peso",
                      "CVE": "Cape Verdean Escudo",
                      "CZK": "Czech Republic Koruna",
                      "DASH": "DASH",
                      "DJF": "Djiboutian Franc",
                      "DKK": "Danish Krone",
                      "DOP": "Dominican Peso",
                      "DZD": "Algerian Dinar",
                      "EGP": "Egyptian Pound",
                      "EOS": "EOS",
                      "ETB": "Ethiopian Birr",
                      "ETH": "Ethereum",
                      "EUR": "Euro",
                      "FJD": "Fijian Dollar",
                      "GBP": "British Pound Sterling",
                      "GEL": "Georgian Lari",
                      "GHS": "Ghanaian Cedi",
                      "GIP": "Gibraltar Pound",
                      "GMD": "Gambian Dalasi",
                      "GNF": "Guinean Franc",
                      "GTQ": "Guatemalan Quetzal",
                      "GYD": "Guyanaese Dollar",
                      "HKD": "Hong Kong Dollar",
                      "HNL": "Honduran Lempira",
                      "HRK": "Croatian Kuna",
                      "HTG": "Haitian Gourde",
                      "HUF": "Hungarian Forint",
                      "IDR": "Indonesian Rupiah",
                      "ILS": "Israeli New Sheqel",
                      "INR": "Indian Rupee",
                      "IQD": "Iraqi Dinar",
                      "IRR": "Iranian Rial",
                      "ISK": "Icelandic Króna",
                      "JMD": "Jamaican Dollar",
                      "JOD": "Jordanian Dinar",
                      "JPY": "Japanese Yen",
                      "KES": "Kenyan Shilling",
                      "KGS": "Kyrgystani Som",
                      "KHR": "Cambodian Riel",
                      "KMF": "Comorian Franc",
                      "KRW": "South Korean Won",
                      "KWD": "Kuwaiti Dinar",
                      "KYD": "Cayman Islands Dollar",
                      "KZT": "Kazakhstani Tenge",
                      "LAK": "Laotian Kip",
                      "LBP": "Lebanese Pound",
                      "LKR": "Sri Lankan Rupee",
                      "LRD": "Liberian Dollar",
                      "LSL": "Lesotho Loti",
                      "LTC": "Litecoin",
                      "LYD": "Libyan Dinar",
                      "MAD": "Moroccan Dirham",
                      "MDL": "Moldovan Leu",
                      "MKD": "Macedonian Denar",
                      "MMK": "Myanma Kyat",
                      "MOP": "Macanese Pataca",
                      "MUR": "Mauritian Rupee",
                      "MVR": "Maldivian Rufiyaa",
                      "MWK": "Malawian Kwacha",
                      "MXN": "Mexican Peso",
                      "MYR": "Malaysian Ringgit",
                      "MZN": "Mozambican Metical",
                      "NAD": "Namibian Dollar",
                      "NGN": "Nigerian Naira",
                      "NIO": "Nicaraguan Córdoba",
                      "NOK": "Norwegian Krone",
                      "NPR": "Nepalese Rupee",
                      "NZD": "New Zealand Dollar",
                      "OMR": "Omani Rial",
                      "PAB": "Panamanian Balboa",
                      "PEN": "Peruvian Nuevo Sol",
                      "PGK": "Papua New Guinean Kina",
                      "PHP": "Philippine Peso",
                      "PKR": "Pakistani Rupee",
                      "PLN": "Polish Zloty",
                      "PYG": "Paraguayan Guarani",
                      "QAR": "Qatari Rial",
                      "RON": "Romanian Leu",
                      "RSD": "Serbian Dinar",
                      "RUB": "Russian Ruble",
                      "RWF": "Rwandan Franc",
                      "SAR": "Saudi Riyal",
                      "SBD": "Solomon Islands Dollar",
                      "SCR": "Seychellois Rupee",
                      "SDG": "Sudanese Pound",
                      "SEK": "Swedish Krona",
                      "SGD": "Singapore Dollar",
                      "SLL": "Sierra Leonean Leone",
                      "SOS": "Somali Shilling",
                      "SRD": "Surinamese Dollar",
                      "SVC": "Salvadoran Colón",
                      "SZL": "Swazi Lilangeni",
                      "THB": "Thai Baht",
                      "TJS": "Tajikistani Somoni",
                      "TMT": "Turkmenistani Manat",
                      "TND": "Tunisian Dinar",
                      "TOP": "Tongan Paʻanga",
                      "TRY": "Turkish Lira",
                      "TTD": "Trinidad and Tobago Dollar",
                      "TWD": "New Taiwan Dollar",
                      "TZS": "Tanzanian Shilling",
                      "UAH": "Ukrainian Hryvnia",
                      "UGX": "Ugandan Shilling",
                      "USD": "United States Dollar",
                      "UYU": "Uruguayan Peso",
                      "UZS": "Uzbekistan Som",
                      "VND": "Vietnamese Dong",
                      "XAF": "CFA Franc BEAC",
                      "XAG": "Silver (troy ounce)",
                      "XAU": "Gold (troy ounce)",
                      "XCD": "East Caribbean Dollar",
                      "XLM": "Stellar Lumens",
                      "XOF": "CFA Franc BCEAO",
                      "XRP": "Ripple",
                      "YER": "Yemeni Rial",
                      "ZAR": "South African Rand",
                      "ZMW": "Zambian Kwacha"
                  }
              }
        """.utf8Encoded
    }
    
    func toGetAllCurrencyResponse() -> CurrencyResponse {
        do {
            let data = try JSONDecoder().decode(CurrencyResponse.self, from: GetAllCurrencyResponseData)
            return data
        } catch {
            fatalError("Can't decode  model.")
        }
    }
    
     var ratesCurrencyResponseData: Data {
        return """
              {
                  "valid": true,
                  "updated": 1612245603,
                  "base": "USD",
                  "rates": {
                      "AED": 3.67338,
                      "AFN": 78.25956,
                      "ALL": 102.27452,
                      "AMD": 518.906,
                      "ANG": 1.79458,
                      "AOA": 656.2448,
                      "ARS": 87.59778,
                      "AUD": 1.31032,
                      "AWG": 1.8,
                      "AZN": 1.7,
                      "BAM": 1.61841,
                      "BBD": 2.01866,
                      "BCH": 0.002404915647583661,
                      "BDT": 84.77185,
                      "BGN": 1.62155,
                      "BHD": 0.37707,
                      "BIF": 1942.1891,
                      "BMD": 1,
                      "BND": 1.33141,
                      "BOB": 6.89315,
                      "BRL": 5.43317,
                      "BSD": 0.99982,
                      "BTC": 0.00002949349638911124,
                      "BTG": 0.0929368029739777,
                      "BWP": 10.98067,
                      "BZD": 2.01527,
                      "CAD": 1.28236,
                      "CDF": 1978.1,
                      "CHF": 0.89636,
                      "CLP": 736.25,
                      "CNH": 6.46607,
                      "CNY": 6.4652,
                      "COP": 3573.1885,
                      "CRC": 613.47327,
                      "CUC": 1,
                      "CUP": 25.75,
                      "CVE": 91.24917,
                      "CZK": 21.47242,
                      "DASH": 0.00952018278750952,
                      "DJF": 177.9853,
                      "DKK": 6.1563,
                      "DOP": 58.04796,
                      "DZD": 132.80444,
                      "EGP": 15.73018,
                      "EOS": 0.3333333333333333,
                      "ETB": 39.48802,
                      "ETH": 0.0007201497911565606,
                      "EUR": 0.82791,
                      "FJD": 2.0498,
                      "GBP": 0.7307,
                      "GEL": 3.31,
                      "GHS": 5.81888,
                      "GIP": 0.7307,
                      "GMD": 51.5225,
                      "GNF": 10278.344,
                      "GTQ": 7.78092,
                      "GYD": 209.17836,
                      "HKD": 7.7526,
                      "HNL": 24.0977,
                      "HRK": 6.27441,
                      "HTG": 71.95048,
                      "HUF": 294.47,
                      "IDR": 14053.7,
                      "ILS": 3.2946,
                      "INR": 73.01515,
                      "IQD": 1459.702,
                      "IRR": 42107.1,
                      "ISK": 128.905,
                      "JMD": 146.72944,
                      "JOD": 0.70905,
                      "JPY": 104.965,
                      "KES": 110.1155,
                      "KGS": 84.80194,
                      "KHR": 4064.1342,
                      "KMF": 405.8705,
                      "KRW": 1116.1208,
                      "KWD": 0.30285,
                      "KYD": 0.83316,
                      "KZT": 424.35292,
                      "LAK": 9322.126,
                      "LBP": 1511.8855,
                      "LKR": 193.9608,
                      "LRD": 171,
                      "LSL": 15.071,
                      "LTC": 0.007427213309566251,
                      "LYD": 4.46184,
                      "MAD": 8.96603,
                      "MDL": 17.2662,
                      "MKD": 50.98513,
                      "MMK": 1327.22035,
                      "MOP": 7.984,
                      "MUR": 39.7,
                      "MVR": 15.4,
                      "MWK": 772.19281,
                      "MXN": 20.2748,
                      "MYR": 4.0462,
                      "MZN": 75.25875,
                      "NAD": 15.071,
                      "NGN": 381.22,
                      "NIO": 34.89282,
                      "NOK": 8.5579,
                      "NPR": 116.52293,
                      "NZD": 1.39278,
                      "OMR": 0.38501,
                      "PAB": 0.99976,
                      "PEN": 3.63702,
                      "PGK": 3.51113,
                      "PHP": 48.0574,
                      "PKR": 160.27122,
                      "PLN": 3.7305,
                      "PYG": 6937.60285,
                      "QAR": 3.64093,
                      "RON": 4.0365,
                      "RSD": 97.31156,
                      "RUB": 75.8683,
                      "RWF": 992.17601,
                      "SAR": 3.75106,
                      "SBD": 8.02171,
                      "SCR": 21.20612,
                      "SDG": 55.22775,
                      "SEK": 8.4103,
                      "SGD": 1.33065,
                      "SLL": 10171.5,
                      "SOS": 584.53,
                      "SRD": 14.1547,
                      "SVC": 8.74873,
                      "SZL": 15.03234,
                      "THB": 29.986,
                      "TJS": 11.39271,
                      "TMT": 3.5,
                      "TND": 2.7,
                      "TOP": 2.30327,
                      "TRY": 7.1812,
                      "TTD": 6.7863,
                      "TWD": 27.9799,
                      "TZS": 2319.1,
                      "UAH": 28.05039,
                      "UGX": 3679.26195,
                      "USD": 1,
                      "UYU": 42.31613,
                      "UZS": 10516.106,
                      "VND": 23028.65,
                      "XAF": 542.82444,
                      "XAG": 0.03493999056620255,
                      "XAU": 0.0005386595994527219,
                      "XCD": 2.70269,
                      "XLM": 3.1201248049921997,
                      "XOF": 542.82444,
                      "XRP": 2.6504108136761197,
                      "YER": 250.415,
                      "ZAR": 14.9857,
                      "ZMW": 21.41532
                  }
              }
        """.utf8Encoded
    }
    
     func toGetRatesResponseData() -> RatesCurrencyResponse {
        do {
            let decoder = JSONDecoder()
            if #available(iOS 10.0, *) {
                decoder.dateDecodingStrategy = .iso8601
            } else {
                // Fallback on earlier versions
            }
            let data = try decoder.decode(RatesCurrencyResponse.self, from: ratesCurrencyResponseData)
            return data
        } catch {
            fatalError("Can't decode  model.")
        }
    }
    
  
     var covertCurrencyResponseData: Data {
        return """
        {
                 "valid": true,
                 "updated": 1527708277,
                 "conversion": {
                     "amount": 99.87,
                     "from": "GBP",
                     "to": "BTC",
                     "result": 0.017462
                 }
             }
        """.utf8Encoded
    }
    
     func toGetCovertCurrencyResponse() -> CovertCurrencyResponse {
        do {
            let decoder = JSONDecoder()
            if #available(iOS 10.0, *) {
                decoder.dateDecodingStrategy = .iso8601
            } else {
                // Fallback on earlier versions
            }
            let data = try decoder.decode(CovertCurrencyResponse.self, from: covertCurrencyResponseData)
            return data
        } catch {
            fatalError("Can't decode  model.")
        }
    }
    
     var errorCurrencyResponseData: Data {
        return """
        {
            "valid": false,
            "error": {
                "code": 401,
                "message": "Your API key is not valid"
            }
        }
        """.utf8Encoded
    }
    
     func toGetErrorCurrencyResponse() -> CurrencyErorrResponse {
        do {
            let decoder = JSONDecoder()
            if #available(iOS 10.0, *) {
                decoder.dateDecodingStrategy = .iso8601
            } else {
                // Fallback on earlier versions
            }
            let data = try decoder.decode(CurrencyErorrResponse.self, from: errorCurrencyResponseData)
            return data
        } catch {
            fatalError("Can't decode  model.")
        }
    }
}
