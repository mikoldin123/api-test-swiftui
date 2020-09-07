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
    let slug: String
    let iso2: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Country"
        case slug = "Slug"
        case iso2 = "ISO2"
    }
}
