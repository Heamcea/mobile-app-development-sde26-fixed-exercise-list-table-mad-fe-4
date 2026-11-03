//
//  CountryDetailView.swift
//  MADExercises
//

import SwiftUI

struct CountryDetailView: View {

    let country: Country

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Text(country.name)
                    .font(.largeTitle)
                    .bold()

                Text("Native Name: \(country.native)")
                Text("Capital: \(country.capital)")
                Text("Currency: \(country.currency)")
                Text("Continent: \(country.continent)")
                Text("Phone: +\(country.phone)")

                Text("Languages")
                    .font(.headline)

                ForEach(country.languages, id: \.self) { language in
                    Text(language)
                }

                Text("Created: \(country.createTime.formatted())")
                Text("Updated: \(country.updateTime.formatted())")
            }
            .padding()
        }
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


