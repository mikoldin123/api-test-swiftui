//
//  NetworkAPI.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/7/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import Foundation
import Combine

class Network {
    static var shared = Network()
    
    var manager: URLSession {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession(configuration: config)
        return session
    }
}

protocol NetworkService {
    var baseURL: String { get }
    var endpoint: String { get }
    var headers: [String: Any]? { get }
    
    func request<T: Codable>() -> AnyPublisher<T, Error>
}

extension NetworkService {
    var headers: [String: Any]? {
        return nil
    }
    
    var client: NetworkAPI {
        return NetworkAPI()
    }
    
    func request<T: Codable>() -> AnyPublisher<T, Error> {
        guard let url = URL(string: baseURL + endpoint) else {
            fatalError("Invalid URL")
        }
        
        let request = URLRequest(url: url)
        
        return client.run(request).map(\.value).eraseToAnyPublisher()
    }
}


struct NetworkAPI {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Codable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        let session = Network.shared.manager
        
        return session
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
