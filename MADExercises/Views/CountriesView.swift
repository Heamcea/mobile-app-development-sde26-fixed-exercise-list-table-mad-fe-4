//
//  CountriesView.swift
//  MADExercises
//
//  Created by Hamza Ahmad
//

import SwiftUI

struct CountriesView: View {
    
    let loggedInUser: User
    let apiClient: APIClient
    
    var body: some View {
        Text("Countries")
            .navigationTitle("Countries")
            .onAppear {
                apiClient.getCountries(loggedInUser: loggedInUser)
            }
    }
}
