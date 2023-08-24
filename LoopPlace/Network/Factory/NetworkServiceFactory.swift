//
//  NetworkServiceFactory.swift
//  LoopPlace
//
//  Created by M_2195552 on 2023-08-24.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> any NetworkRequestProtocol {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment, environment == "TEST" {
            //return MockNetworkService()
        }
        return APIManager()
    }
}
