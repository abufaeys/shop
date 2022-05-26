//
//  NetworkConfig.swift
//  Shop
//
//  Created by mohammad shalhoob on 26/05/2022.
//

import Foundation

protocol NetworkEnvironment {
    var scheme : String { get }
    var baseUrl: String { get }
    var `default`: String { get }
    var isEnabledNetworkMock: Bool { get }
}

struct NetworkConfig {
    static let current: NetworkEnvironment = Development()

    struct Development: NetworkEnvironment {
        let scheme = "https"
        let baseUrl = "ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
        let `default` =  "default/dynamodb-writer"
        let isEnabledNetworkMock = false
    }

    struct Mock: NetworkEnvironment {
        var scheme: String = ""
        var baseUrl: String = ""
        var `default`: String = ""
        let isEnabledNetworkMock = true
    }
    
    struct Production: NetworkEnvironment {
        let scheme = "https"
        let baseUrl = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/"
        let `default` =  "default/dynamodb-writer"
        let isEnabledNetworkMock = false
    }
}
