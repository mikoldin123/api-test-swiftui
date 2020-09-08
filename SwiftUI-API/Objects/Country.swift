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
    let slug: String?
    let iso2: String?
    
    let code: String?
    let lat: String?
    let lon: String?
    
    let confirmed: Int?
    let deaths: Int?
    let recovered: Int?
    let active: Int?
    
    let date: String?
    let locationId: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Country"
        case slug = "Slug"
        case iso2 = "ISO2"
        
        case code = "CountryCode"
        case lat = "Lat"
        case lon = "Lon"
        
        case confirmed = "Confirmed"
        case deaths = "Deaths"
        case recovered = "Recovered"
        case active = "Active"
        
        case date = "Date"
        case locationId = "LocationID"
    }
}
