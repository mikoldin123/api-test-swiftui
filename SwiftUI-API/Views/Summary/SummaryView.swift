//
//  SummaryView.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/7/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var body: some View {
        VStack {
            Path { path in
                
                path.move(to: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2))
                
                path.addArc(center: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2), radius: 180, startAngle: .zero, endAngle: .init(degrees: 90), clockwise: false)
            }.fill(Color.green)
        }
        
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(country: Country(name: "Philippines", info: CountryInfo(id: 0, iso2: "PH", iso3: "PHL", lat: 0, long: 0, flag: ""), updated: 0, cases: 0, deaths: 0, recovered: 0, active: 0, critical: 0, todayCases: 0, todayDeaths: 0, todayRecovered: 0, continent: "Asia", population: 1))
    }
}
