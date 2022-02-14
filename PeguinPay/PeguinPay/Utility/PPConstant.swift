//
//  PPConstant.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

struct PPAppID {
    static let exchange = "77d75a6b1d9e4f1fa27ee9b1abb0ce91";
}

struct PPNetworkURL {
    static let base = "https://openexchangerates.org"
    static let exchange = base + "/api/latest.json?app_id=\(PPAppID.exchange)"
}

enum PPCountry: String {
    case usa = "usa"
    case kenya = "kenya"
    case uganda = "uganda"
    case binaria = "binaria"
    case nigeria = "nigeria"
    
    func currency() -> String {
        switch self {
        case .kenya:    return "KES"
        case .uganda:   return "UGX"
        case .binaria:  return "USD"
        case .usa:      return "USD"
        case .nigeria:  return "NGN"
        }
    }
    
    static func receiver() -> [PPCountry] {
        return [.kenya, .uganda, .nigeria]
    }
    
    static func sender() -> [PPCountry] {
        return [.usa, .binaria]
    }
}



