//
//  PieChart.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/8/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI

struct PieChart: View {
    
    var array: [ChartData]
    var center: CGPoint
    var index: Int
    
    var pie: ChartData {
        return array[index]
    }

    var body: some View {
        ZStack {
            Path { path in
                
                path.move(to: self.center)
                path.addArc(center: self.center, radius: 180, startAngle: .init(degrees: self.from()), endAngle: .init(degrees: self.to()), clockwise: false)
                path.closeSubpath()
            }.fill(pie.color)
        }
    }
    
    func from() -> Double {
        if index == 0 {
            return 0
        }
        
        var temp: Double = 0
        
        for idx in 0...(index-1) {
            temp += Double(array[idx].percent / 100) * 360
        }
        
        return temp
    }
    
    func to() -> Double {
        var temp: Double = 0
        
        for idx in 0...index {
            temp += Double(array[idx].percent / 100) * 360
        }
        
        return temp
    }
}
