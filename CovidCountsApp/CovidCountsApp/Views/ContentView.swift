//
//  ContentView.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/9/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: PROPERTIES
    
    //subscribe to updates from Network Manager
    @ObservedObject var networkManager = NetworkManager()
    @State var appStart = false
    
    //MARK: VIEW
    var body: some View {
        NavigationView {
            List {
                ForEach (networkManager.stateDataList) { state in
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
            if appStart == false {
                networkManager.fetchData() //call fetchData on startup
            }
            appStart = true
        }
    }

    //MARK: FUNCTIONS
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




