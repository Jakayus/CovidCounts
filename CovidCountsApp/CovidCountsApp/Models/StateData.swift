//
//  StateData.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/10/21.
//

// API documentation located here:
// https://disease.sh/docs/#/COVID-19%3A%20Worldometers/get_v3_covid_19_states
// This model reflects /v3/covid-19/states API


import Foundation

struct StateData: Codable, Identifiable {
    
    var id: String {
        return state
    }
    
    let state: String
    let cases: Int
    let population: Int?
    
}

extension StateData {
    //Dummy Data
    static let fl = StateData(state: "Sample State", cases: 100, population: nil)
}

