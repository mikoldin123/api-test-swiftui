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
    
    var cancelationToken: AnyCancellable?
    
    func fetchCountries() {
        cancelationToken = CountryAPI
            .allCountries
            .request()
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in
                print("DONE")
            }) { [weak self] (countries: [Country]) in
                guard let this = self else { return }
                this.countries = countries.sorted(by: { $0.name < $1.name })
            }
    }
}
