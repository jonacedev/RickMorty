//
//  RequestModel.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

struct RequestModel {
    var path: APIPaths
    var method: HTTPMethods
    var headers: [String: String]?
    var body: Data?
    var queryParameters: [String: String]?
    
    init(path: APIPaths,
         method: HTTPMethods,
         headers: [String: String]? = nil,
         body: Data? = nil,
         queryParameters: [String: String]? = nil
    ) {
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
        self.queryParameters = queryParameters
    }
    
    func getPath() -> String {
        path.rawValue
    }
}
