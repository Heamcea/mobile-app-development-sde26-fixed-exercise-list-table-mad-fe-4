//
//  CountryDetailView.swift
//  MADExercises
//

import SwiftUI

struct CountryDetailView: View {

    let country: Country

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 25) {

                VStack(alignment: .center, spacing: 5) {
                    Text(country.name)
                        .font(.largeTitle)
                        .bold()

                    Text(country.native)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                Divider()

                VStack(alignment: .center, spacing: 10) {
                    Text("Country Information")
                        .font(.headline)

                    #if DEBUG
                    Text("ID: \(country.ID)")
                    #endif
                    Text("Capital: \(country.capital)")
                    Text("Currency: \(country.currency)")
                    Text("Continent: \(country.continent)")
                    Text("Phone: +\(country.phone)")
                }

                Divider()

                VStack(alignment: .center, spacing: 10) {
                    Text("Languages")
                        .font(.headline)

                    ForEach(country.languages, id: \.self) { language in
                        Text("• \(language)")
                    }
                }

                Divider()

                VStack(alignment: .center, spacing: 8) {
                    Text("Additional Information")
                        .font(.headline)

                    Text("Created: \(country.createTime.formatted())")
                    Text("Updated: \(country.updateTime.formatted())")
                }
            }
            .padding()
        }
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
