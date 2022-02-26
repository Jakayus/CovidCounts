//
//  ErrorTypes.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 2/25/22.
//

import Foundation

enum CCError: Error {
    case invalidData
    case invalidURL
    case invalidResponse
    case issueOccured   //catch all error for now
}
