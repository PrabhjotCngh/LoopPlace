//
//  Constants.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-21.
//

import Foundation

enum OnboardingViewConstants {
    enum Image {
        static let marketplace = "ic_launch"
    }
    
    enum Text {
        static let welcome = "All that you need, \nAll that you want \njust here at all!"
        static let marketplace = "Marketplace..!"
    }
}

enum HomeDashboardViewConstants {
    enum Text {
        static let hotDeals = "Hot Deals"
        static let error = "Error!"
    }
}

enum APIConstants {
    static let categoryListAPIUrl = "https://pubservices.banyanpro.com/api/ProductCategories"
    static let categoryItemListAPIUrl = "https://pubservices.banyanpro.com/api/Items?categoryID="

    enum APIErrorMessages {
        static let invalidURL = "Incorrect url!"
        static let invalidData = "Response data is empty!"
        static let genericMessage = "Something went wrong! Please try again later"
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidData
    case invalidResponse
    case decodingError(Error)
    case apiError(Error)
}
