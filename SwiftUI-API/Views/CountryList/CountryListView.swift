//
//  CountryList.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/7/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct CountryListView: View {
    
    @ObservedObject var model = CountryListViewModel()
    
    let test: [Country] = []
    
    let isSearching: Bool = false
    
    init() {
        model.fetchCountries()
    }
    
    var body: some View {
        ViewBuilder.buildBlock(
            isSearching ?
                ViewBuilder.buildEither(first: SearchingView(countries: model.countries)):
                ViewBuilder.buildEither(second: DisplayView(sectioned: model.sectioned))
        )
    }
}

struct SearchingView: View {
    
    var countries: [Country]
    
    var body: some View {
        List(countries) { country in
            NavigationLink(destination: SummaryView(country: country).navigationBarTitle(country.name)) {
                CountryListCell(country: country)
            }
        }.listStyle(GroupedListStyle())
    }
}

struct DisplayView: View {
    var sectioned: [String: [Country]]
    
    var body: some View {
        List {
            ForEach(sectioned.keys.sorted(), id: \.self) { key in
                CountrySectionHeaderCell(title: key, array: self.sectioned[key] ?? [])
            }
        }.listStyle(GroupedListStyle())
    }
}

struct CountrySectionHeaderCell: View {
    var title: String
    var array: [Country]
    
    var body: some View {
        Section(header: Text(title).font(Font.headline)) {
            ForEach(array, id: \.self) { country in
                NavigationLink(destination: SummaryView(country: country).navigationBarTitle(country.name)) {
                    CountryListCell(country: country)
                }
            }
        }
    }
}

struct CountryListCell: View {
    var country: Country
    
    var body: some View {
        HStack(alignment: .top) {
            HStack {
                KFImage(URL(string: country.info.flag))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 50)
                    .padding(.all, 8.0)
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(country.name).font(.headline).lineLimit(3)
                    Text(country.info.code).font(.subheadline)
                }
            }
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
