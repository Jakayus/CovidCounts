//
//  ContentView.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/9/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: PROPERTIES
    @StateObject private var viewModel = CCViewModel()

    //MARK: VIEW
    var body: some View {
        NavigationView {
            List {
                ForEach (viewModel.states) { state in
                    NavigationLink (destination: StateView(stateData: state) ) {
                        Text("\(state.state)")
                    }
                }
            }
            
        .navigationTitle("COVID Counts")
        }
        //.navigationTitle("test")
        .navigationViewStyle(.stack)
        .onAppear {
            if viewModel.appStart == false {
                viewModel.getData()
            }
            viewModel.appStart = true
        }
    }

    //MARK: FUNCTIONS

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




