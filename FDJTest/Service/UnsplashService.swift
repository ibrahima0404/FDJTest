//
//  UnsplashService.swift
//  FDJTest
//
//  Created by Ibrahima KH GUEYE on 19/03/2022.
//

import Foundation
import Combine

class UnsplashService: ServiceProtocol {
    func searchImages(_ endpoint: Endpoint) throws -> AnyPublisher<UnsplashResponse, Error> {
        guard let url = endpoint.url else {
            throw NSError(domain: "Invalid url", code: 20, userInfo: nil)
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { result -> UnsplashResponse in
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(UnsplashResponse.self, from: result.data)
                return decoded
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
