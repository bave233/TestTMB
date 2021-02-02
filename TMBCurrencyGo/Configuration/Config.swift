//
//  Config.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//

import Foundation

class Config {
    enum Environment {
        case prod
        case nonProd
    }
    
    static var currencyAPIEndPoint : String = "https://currencyapi.net"
    static var currencyBaseAPIKeys : String = "rFf41VaM2Pkczf95kaWriWbyeo9g0yvowMVl"
    
}
