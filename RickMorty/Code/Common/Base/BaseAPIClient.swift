//
//  BaseAPIClient.swift
//  RickMorty
//
//  Created by Jonathan Miguel Onrubia Solis on 19/10/24.
//

import Foundation

class BaseAPIClient {
    
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
    }()

    private var baseURL: URL {
        if let url = URL(string: EnvironmentApp.shared.baseURL) {
            return url
        } else {
            print("error.url.invalid".localized)
            return URL(string: "")!
        }
    }

    // MARK: - Public method
        
    func request<T: Decodable>(requestModel: RequestModel) async throws -> T {
        
        var model = requestModel
        model.headers = addCustomHeaders(model.headers)
        print(requestModel)
        
        // MARK: - Make request
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await makeRequest(requestModel: model)
        } catch {
            print("Failed to make request: \(error)")
            throw BaseError.generic
        }
        
        print((response as? HTTPURLResponse)?.statusCode ?? "")
        print(String(data: data, encoding: .utf8) ?? "")
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            let error = try? JSONDecoder().decode(ErrorResponse.self, from: data)
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            if statusCode == 404 {
                throw BaseError.notFound
            } else {
                throw BaseError.apiError(error, statusCode)
            }
        }
        
        
        // MARK: - Try to decode
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw BaseError.generic
        }
    }
    
    private func makeRequest(requestModel: RequestModel) async throws -> (Data, URLResponse) {
        
        let urlString = baseURL.appendingPathComponent(requestModel.getPath()).absoluteString
        guard var absoluteURL = URL(string: urlString) else {
            throw BaseError.generic
        }
        
        if let queryParameters = requestModel.queryParameters {
            absoluteURL = absoluteURL.appending(queryParameters: queryParameters)
        }
        
        var request = URLRequest(url: absoluteURL)
        request.httpMethod = requestModel.method.rawValue
        request.allHTTPHeaderFields = requestModel.headers
        request.httpBody = requestModel.body
       
        return try await session.data(for: request)
    }
    
    private func addCustomHeaders(_ headers: [String: String]?) -> [String: String] {
        
        let customHeaders = ["Content-Type": "application/json"]
        guard let headers else { return customHeaders }
        
        return customHeaders.merging(headers) { current, _ in
            return current
        }
    }
}
