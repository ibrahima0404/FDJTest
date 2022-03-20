//
//  Endpoint.swift
//  FDJTest
//
//  Created by Ibrahima KH GUEYE on 19/03/2022.
//

import Foundation

struct Endpoint {
    static private let key = "a76ebbad189e7f2ae725980590e4c520a525e1db029aa4cea87b44383c8a1ec4"

    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func search(matching query: String, pages page: Int) -> Endpoint {
        return Endpoint(
            path: "/search/photos",
            queryItems: [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "page", value: String(page)),
                URLQueryItem(name: "client_id", value: key)
            ]
        )
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = path
        components.queryItems = queryItems
      
        return components.url
    }
}
