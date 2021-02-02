//
//  MoyaCustomTargetType.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//

import Alamofire
import Foundation
import Moya
struct JSONStringArrayEncoding: ParameterEncoding {
    private let myString: String

    init(string: String) {
        self.myString = string
    }

    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = urlRequest.urlRequest

        let data = myString.data(using: .utf8)!

        if urlRequest?.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        urlRequest?.httpBody = data

        return urlRequest!
    }
}

/// The custom protocol used to define the specifications necessary for a `MoyaProvider`.
public protocol MoyaCustomTargetType: TargetType {
    /// The JSONDecoder to perform on the success response. Default is `JSONDecoder()`.
    var jsonDecoder: JSONDecoder { get }

    /// Controls how stub responses are returned. Default is `.never`.
    var stubBehavior: Moya.StubBehavior { get }

    /// A Boolean value determining whether the mapping should fail if the data is empty. Default is `true`.
    var failsOnEmptyData: Bool { get }
}

public extension MoyaCustomTargetType {
    /// The JSONDecoder to perform on the success response. Default is `JSONDecoder()`.
    var jsonDecoder: JSONDecoder {
        return JSONDecoder()
    }

    /// Controls how stub responses are returned. Default is `.never`.
    var stubBehavior: Moya.StubBehavior {
        return Moya.StubBehavior.never
    }

    /// A Boolean value determining whether the mapping should fail if the data is empty. Default is `true`.
    var failsOnEmptyData: Bool {
        return false
    }
}
