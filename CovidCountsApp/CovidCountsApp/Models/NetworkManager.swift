//
//  NetworkManager.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/10/21.
//

import Foundation

// ObservableObject makes network manager observable
class NetworkManager: ObservableObject {
    
    @Published var stateDataList = [StateData]()
    
    //TODO: Consider Refactoring with Combine or Async Await
    func fetchData() {
        
        //hard coded API call for now
        if let url = URL(string: "https://disease.sh/v3/covid-19/nyt/states?lastdays=1") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    
                    // Assumption 1: with error nil, assume data exists
                    // Assumption 2: data is in json format
                    
                    //decode JSON
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode([StateData].self, from: safeData)
                            
                            DispatchQueue.main.async {
                                self.stateDataList = results
                            }
                        }
                        catch {
                            print(error)
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    } // end fetchData()
    
} // end class
