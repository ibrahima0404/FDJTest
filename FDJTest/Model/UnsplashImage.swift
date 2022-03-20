//
//  UnsplashImage.swift
//  FDJTest
//
//  Created by Ibrahima KH GUEYE on 19/03/2022.
//

import Foundation

struct UnsplashImage: Decodable, Equatable, Identifiable {
    let id: String
    let description: String?
    let urls: [String : String]
    var url: URL? {
        guard let urlString = urls["thumb"] else { return nil }
        return URL(string: urlString)
    }
}

struct UnsplashResponse: Decodable {
    let total_pages: Int
    let results: [UnsplashImage]
}

