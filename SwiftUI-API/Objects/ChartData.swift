//
//  ChartData.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/8/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import Foundation
import SwiftUI

struct ChartData: Identifiable {
    var id: Int
    var percent: Double
    var value: Double
    var name: String
    var color: Color
    
    var angle: Double {
        let temp = self.percent / 100
        return Double(temp * 360)
    }
}

extension Double {
    func roundTo(decimalPlaces: Int) -> String {
        return String(format: "%.\(decimalPlaces)f", self) as String
    }
}
