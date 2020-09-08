//
//  CountryList.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/7/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI

struct CountryListView: View {
    
    @ObservedObject var model = CountryListViewModel()
    
    let test: [Country] = []
    
    init() {
        model.fetchCountries()
    }
    
    var body: some View {
        List(model.countries) { country in
            NavigationLink(destination: SummaryView(country: country).navigationBarTitle(country.name)) {
                CountryListCell(country: country)
            }
        }
    }
}

struct CountryListCell: View {
    var country: Country
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(country.name).font(.headline).lineLimit(3)
                Text(country.info.code).font(.subheadline)
            }
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
