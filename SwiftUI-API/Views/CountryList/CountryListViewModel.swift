//
//  CountryListViewModel.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/7/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI
import Combine

class CountryListViewModel: ObservableObject {
    
    @Published var countries: [Country] = []
    @Published var sectioned: [String: [Country]] = [:]
    @Published var isSearching: Bool = true
    
    var cancelationToken: AnyCancellable?
    
    func fetchCountries() {
        cancelationToken = CasesAPI
            .countries
            .request()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in
                print("DONE")
            }) { [weak self] (countries: [Country]) in
                guard let this = self else { return }
                /*this.countries = Dictionary(grouping: countries.sorted(by: { $0.name < $1.name }), by: { $0.continent })*/
                let sorted = countries.sorted(by: { $0.name < $1.name })
                
                let dict = Dictionary<String, [Country]>(grouping: sorted) { (country: Country) in
                    if country.continent.isEmpty {
                        return "Others"
                    }
                    return country.continent
                }
                
                this.countries = sorted
                this.sectioned = dict
            }
    }
}
