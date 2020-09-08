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
        VStack(alignment: .leading, spacing: 4.0) {
            Text(country.name).font(.headline).lineLimit(3)
            Text(country.code ?? "").font(.subheadline)
        }.padding(.top)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(country: Country(name: "Country", slug: "slug", iso2: "iso2", code: nil, lat: nil, lon: nil, confirmed: nil, deaths: nil, recovered: nil, active: nil, date: nil, locationId: nil))
    }
}
