//
//  CCViewModel.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 2/26/22.
//

import SwiftUI

final class CCViewModel: ObservableObject {
    
    @Published var states: [StateData] = []
    
    @Published var appStart = false
    
    func getData() {
        
        NetworkManager.shared.fetchData { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let statesList):
                    self.states = statesList
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
}
