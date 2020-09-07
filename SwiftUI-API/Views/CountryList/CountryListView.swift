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
    
    init() {
        model.fetchCountries()
    }
    
    var body: some View {
        List(model.countries) { country in
            Text(country.name)
        }
    }
}

/*struct CountryListCell {
    <#fields#>
}*/

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
