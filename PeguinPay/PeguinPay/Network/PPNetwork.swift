//
//  PPNetwork.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

class PPNetwork :  NSObject {
    
    static let shared = PPNetwork()
    
    private override init() {
        // please use shared
    }
    
    func dataTask(apiRequest: PPRequest, completion: @escaping (PPResponse) -> Void) {
        if let request = apiRequest.request {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                let response = PPResponse(data: data, response: response, error: error)
                completion(response)
            }.resume()
        }
    }
}

