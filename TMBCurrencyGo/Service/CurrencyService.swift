//
//  CurrencyService.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//

import Alamofire
import Moya

public enum CurrencyService {
    case getCurrencies
    case getCovertCurrencies(amount: String, from: String, to: String)
    case getRatesCurrencies
}

extension CurrencyService: MoyaCustomTargetType {
    public var validationType: ValidationType {
        .successAndRedirectCodes
    }
    
    public var failsOnEmptyData: Bool {
        return false
    }
    
    public var sampleData: Data {
        switch self {
        case .getCurrencies, .getCovertCurrencies, .getRatesCurrencies:
            return """
            []
            """.utf8Encoded
        }
    }
    
    public var baseURL: URL {
        guard let baseURL = URL(string: Config.currencyAPIEndPoint) else {
            return URL(fileURLWithPath: "")
        }
        return baseURL
    }
    
    public var path: String {
        switch self {
        case .getCurrencies:
            return "api/v1/currencies"
        case .getCovertCurrencies:
            return "api/v1/convert"
        case .getRatesCurrencies:
            return "api/v1/rates"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getCurrencies, .getCovertCurrencies, .getRatesCurrencies: return .get
        }
    }
    
    public var parameters: [String: Any] {
        switch self {
        case .getCurrencies, .getRatesCurrencies:
            return ["key": Config.currencyBaseAPIKeys,
                    "output": "JSON"]
        case .getCovertCurrencies(let amount, let from, let to):
            return ["key": Config.currencyBaseAPIKeys,
                    "amount": amount,
                    "from": from,
                    "to": to]
        }
    }
    
    public var task: Task {
        let encoding: ParameterEncoding = method == .get ? Alamofire.URLEncoding.default : Alamofire.JSONEncoding.default
        return Task.requestParameters(parameters: parameters, encoding: encoding)
    }
    
    public var jsonDecoder: JSONDecoder {
        switch self {
        case .getCurrencies, .getCovertCurrencies, .getRatesCurrencies:
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601)
            return decoder
        }
    }
    
    public var headers: [String: String]? {
        return [
            "Content-Type": "application/json;charset=utf-8",
        ]
    }
}
