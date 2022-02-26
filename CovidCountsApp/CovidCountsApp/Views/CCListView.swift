//
//  ContentView.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/9/21.
//

import SwiftUI

struct CCListView: View {
    
    //MARK: PROPERTIES
    @StateObject private var viewModel = CCListViewModel()

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
        .navigationViewStyle(.stack)
        .onAppear {
            if viewModel.appStart == false {
                viewModel.getData()
            }
            viewModel.appStart = true
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CCListView()
    }
}




