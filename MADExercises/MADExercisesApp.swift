//
//  MADExercisesApp.swift
//  MADExercises
//
//  Created by Hamza Ahmad on 27.09.26.
//

import SwiftUI

@main
struct MADExercisesApp: App {
    
    @State private var navigationPath = NavigationPath()
    
    private let apiClient = APIClient()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoginView(apiClient: apiClient)
            }
        }
    }
}
