//
//  CountriesView.swift
//  MADExercises
//
//  Created by Hamza Ahmad
//

import SwiftUI

struct CountriesView: View {
    
    @State private var countries: [Country]?
    
    @State private var isLoading = true
    
    @State private var showError = false
    
    @State private var errorMessage = ""
    
    let loggedInUser: User
    let apiClient: APIClient
    
    var body: some View {
        Group {
            if isLoading {
                ProgressView()
            } else if let countries {
                List {
                    ForEach(countries, id: \.ID) { country in
                        NavigationLink {
                            CountryDetailView(country: country)
                        } label: {
                            Text(country.name)
                                .font(.headline)
                                .padding(.all, 5)
                        }
                    }
                }
            } else {
                Text("Could not load countries.")
            }
        }
        .navigationTitle("Countries")
        .alert(
            "Error",
            isPresented: $showError
        ) {
            Button("OK", role: .cancel) {
            }
        } message: {
            Text(errorMessage)
        }
        .onAppear {
            loadCountries()
        }
    }
    private func loadCountries() {
        isLoading = true
        
        apiClient.getCountries(
            loggedInUser: loggedInUser
        ) { loadedCountries, error in

            if let loadedCountries {
                countries = loadedCountries
                isLoading = false
                return
            }

            if let error {
                isLoading = false
                handleNetworkingError(error)
            }
        }
    }
    private func handleNetworkingError(_ error: NetworkingError) {
        switch error {
        case .networkUnavailable(let message):
            errorMessage = message

        case .invalidResponse:
            errorMessage = "The server returned an invalid response."

        case .unsuccessfulStatusCode(let statusCode):
            errorMessage = "Server returned status code \(statusCode)."

        case .unexpectedError:
            errorMessage = "An unexpected error occurred."

        default:
            errorMessage = "Could not load countries."
        }

        showError = true
    }




}
