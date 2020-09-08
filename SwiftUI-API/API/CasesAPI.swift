//
//  CountryAPI.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/7/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import Foundation
import Combine

enum CasesAPI {
    case countries
}

extension CasesAPI: NetworkService {
    var baseURL: String {
        return API.baseURL
    }
    
    var endpoint: String {
        return "countries"
    }
}
