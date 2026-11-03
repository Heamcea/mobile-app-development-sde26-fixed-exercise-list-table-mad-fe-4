//
//  CountriesResponseError.swift
//  MADExercises
//
//  Created by Hamza Ahmad
//

import Foundation

struct CountriesResponseError: Decodable {
    let error: ErrorInfo

    struct ErrorInfo: Decodable {
        let code: Int
        let message: String
        let status: String
    }
}
