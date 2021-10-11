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
    
    
    //MARK: VIEW
    var body: some View {
        NavigationView {
            List(networkManager.stateDataList) { state in
                Text(state.state)
            }
        }
        .onAppear {
            networkManager.fetchData() //call fetchData on startup
        }
    }
    
    
    
    
    //MARK: FUNCTIONS
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




