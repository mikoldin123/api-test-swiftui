//
//  Country.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/7/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import Foundation
import SwiftUI

struct Country: Identifiable, Codable {
    let id = UUID()
    
    let name: String
    let info: CountryInfo
    
    let updated: Int
    
    let cases: Int
    let deaths: Int
    let recovered: Int
    let active: Int
    let critical: Int
    
    let todayCases: Int
    let todayDeaths: Int
    let todayRecovered: Int

    let continent: String
    let population: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "country"
        case info = "countryInfo"
        case updated, cases, deaths, recovered, active, critical, todayCases, todayDeaths, todayRecovered, continent, population
    }
}

struct CountryInfo: Codable {
    
    let id: Int?
    
    let iso2: String?
    let iso3: String?
    
    let lat: Float
    let long: Float
    
    let flag: String
    
    var code: String {
        if let iso = iso2 {
            return iso
        }
        
        if let iso = iso3 {
            return iso
        }
        
        return ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case iso2, iso3, lat, long, flag
    }
}
