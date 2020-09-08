//
//  ContentView.swift
//  SwiftUI-API
//
//  Created by Michael Dean Villanda on 9/7/20.
//  Copyright © 2020 Michael Dean Villanda. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        NavigationView {
            CountryListView().navigationBarTitle("Country List")
        }.padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
