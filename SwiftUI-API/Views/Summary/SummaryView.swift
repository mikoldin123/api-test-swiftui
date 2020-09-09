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
 
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4.0) {
                HStack {
                    Spacer()
                }
                CasesSummaryView(title: "TOTAL CASES:", value: "\(country.cases)")
                CasesSummaryView(title: "RECOVERED:", value: "\(country.recovered)")
                CasesSummaryView(title: "ACTIVE:", value: "\(country.active)")
                CasesSummaryView(title: "DEATHS:", value: "\(country.deaths)")
                
            }.padding(.leading, 16.0)
            
            GeometryReader { geo in
                ZStack {
                    ForEach(0..<self.country.chartData.count, id: \.self) { index in
                        PieChart(array: self.country.chartData, center: CGPoint(x: geo.frame(in: .global).width / 2, y: geo.frame(in: .global).height / 2), index: index)
                    }
                }
            }
            .frame(height: 360)
            .padding(.top, 20).clipShape(Circle())
            
            VStack {
                
                ForEach(self.country.chartData) { item in
                    HStack() {
                        Text(item.name).frame(width: 100.0)
                        
                        GeometryReader { geo in
                            HStack {
                                Spacer(minLength: 0)
                                Rectangle()
                                    .fill(item.color)
                                    .frame(width: self.getWidth(geo.frame(in: .global).width - 120.0, forValue: CGFloat(item.percent)), height: 10)
                                
                                Text("\(item.percent.roundTo(decimalPlaces: 1)) %")
                                    .fontWeight(.bold).padding(.leading, 16.0)
                            }
                            
                        }
                    }.padding(.init(top: 0, leading: 0, bottom: 0.0, trailing: 0))
                }
            }
            .padding()
            
            Spacer()
        }
    }
    
    func getWidth(_ width: CGFloat, forValue value: CGFloat) -> CGFloat {
        return (value / 100) * width
    }
}

struct CasesSummaryView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title).font(Font.headline)
                Text(value).font(Font.subheadline)
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(country: Country(name: "Philippines", info: CountryInfo(id: 0, iso2: "PH", iso3: "PHL", lat: 0, long: 0, flag: ""), updated: 0, cases: 0, deaths: 0, recovered: 0, active: 0, critical: 0, todayCases: 0, todayDeaths: 0, todayRecovered: 0, continent: "Asia", population: 1))
    }
}
