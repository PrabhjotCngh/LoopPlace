//
//  Constants.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-21.
//

import Foundation

enum HomeScreenConstants {
    enum Image {
        static let marketplace = "ic_launch"
    }
    
    enum Text {
        static let welcome = "All that you need, \nAll that you want \njust here at all!"
        static let marketplace = "Marketplace..!"
    }
}

enum APIConstants {
    static let apiUrl = "https://pubservices.banyanpro.com/api/ProductCategories"
}

enum NetworkError: Error {
    case invalidURL
    case invalidData
    case invalidResponse
    case decodingError(Error)
    case apiError(Error)
}
