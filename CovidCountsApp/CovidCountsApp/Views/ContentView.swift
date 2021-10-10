//
//  ContentView.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/9/21.
//

import SwiftUI

struct ContentView: View {
    
    let sampleDataSet = [
        SampleData(id: 1, title: "FL"),
        SampleData(id: 2, title: "AZ"),
        SampleData(id: 3, title: "HI")
    ]
    
    
    var body: some View {
        NavigationView {
            List(sampleDataSet) { state in
                Text(state.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct SampleData: Identifiable {
    let id: Int
    let title: String
}


