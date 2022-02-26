//
//  ContentView.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/9/21.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: PROPERTIES
    @State private var states: [StateData] = []
    
    

    @State var appStart = false
    
    //MARK: VIEW
    var body: some View {
        NavigationView {
//            Text("test")
            List {
                ForEach (states) { state in
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
                getData()
            }
            appStart = true
        }
    }

    //MARK: FUNCTIONS
    func getData() {
        
        NetworkManager.shared.fetchData { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let statesList):
                    states = statesList
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




