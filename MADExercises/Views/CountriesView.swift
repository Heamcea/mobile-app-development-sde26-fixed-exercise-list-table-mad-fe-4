//
//  CountriesView.swift
//  MADExercises
//
//  Created by Hamza Ahmad
//

import SwiftUI

struct CountriesView: View {
    
    @State private var countries: [Country]?
    
    let loggedInUser: User
    let apiClient: APIClient
    
    var body: some View {
        Group {
            if let countries {
                List {
                    ForEach(countries, id: \.ID) { country in
                        NavigationLink {
                            CountryDetailView(country: country)
                        } label: {
                            Text(country.name)
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle("Countries")
        .onAppear {
            loadCountries()
        }
    }
    private func loadCountries() {
        apiClient.getCountries(
            loggedInUser: loggedInUser
        ) { loadedCountries, error in

            if let loadedCountries {
                countries = loadedCountries
                return
            }

            if let error {
                print(error)
            }
        }
    }

}
