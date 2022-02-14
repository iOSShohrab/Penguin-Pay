//
//  PPRequest.swift
//  PeguinPay
//
//  Created by Md Shohrab Hossain on 2/13/22.
//

import Foundation

struct PPRequest {
    var urlString: String
    var request: URLRequest?
    
    init(urlString: String) {
        self.urlString = urlString
        if let url = URL(string: urlString) {
            request = URLRequest(url: url)
        }
    }
    
    init(urlString: String, using requestBody: Data?) {
        self.urlString = urlString
        if let url = URL(string: urlString) {
            request = URLRequest(url: url)
            request?.httpBody = requestBody
        }
    }
}
