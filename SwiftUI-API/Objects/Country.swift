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
    
    var chartData: [ChartData] {
        return [
            .init(id: 0, percent: percent(self.active), value: Double(self.active), name: "ACTIVE", color: .yellow),
            .init(id: 1, percent: percent(self.recovered), value: Double(self.recovered), name: "RECOVERED", color: .green),
            .init(id: 2, percent: percent(self.deaths), value: Double(self.deaths), name: "DEATHS", color: .red)
        ]
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "country"
        case info = "countryInfo"
        case updated, cases, deaths, recovered, active, critical, todayCases, todayDeaths, todayRecovered, continent, population
    }
    
    
    private func percent(_ value: Int) -> Double {
        
        let val = Double(value)/Double(self.cases)
        
        let percent = Double(val * 100.0)
        
        /*print("percent --- \(percent)")
        
        print("percent --- \(percent * 100)")*/
        
        return percent
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
