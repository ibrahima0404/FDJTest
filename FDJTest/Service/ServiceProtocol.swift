//
//  ServiceProtocol.swift
//  FDJTest
//
//  Created by Ibrahima KH GUEYE on 19/03/2022.
//

import Foundation
import Combine

protocol ServiceProtocol {
    func searchImages(_ endpoint: Endpoint) throws -> AnyPublisher<UnsplashResponse, Error>
}
