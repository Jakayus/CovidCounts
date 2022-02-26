//
//  NetworkManager.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/10/21.
//

import Foundation
import SwiftUI

// ObservableObject makes network manager observable
final class NetworkManager {
    
    //create a singleton to use
    static let shared = NetworkManager()
    
    //@Published var stateDataList = [StateData]()
    static let mainURLString = "https://disease.sh/v3/covid-19/nyt/states"
    private let apiURLString = mainURLString + "?lastdays=1"
    
    private init() {}
    
    //TODO: Consider Refactoring with Combine or Async Await
    func fetchData(completed: @escaping (Result<[StateData], CCError>) -> Void) {
        
        //verify URL first
        guard let url = URL(string: apiURLString) else {
            completed(.failure(.invalidURL))
            return
        }
        
        //create data task to download information
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            //check the different types then decode json
            if let _ = error  {
                completed(.failure(.issueOccured))
                return
            }

            //check response against error code 200
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let decodedData = try jsonDecoder.decode([StateData].self, from: data)
                completed(.success(decodedData))
                

            } catch {
                completed(.failure(.issueOccured))
            }
            
            
            
            
            
        }
        task.resume()
        
        
//        //hard coded API call for now
//        if let url = URL(string: "https://disease.sh/v3/covid-19/nyt/states?lastdays=1") {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if error == nil {
//
//                    // Assumption 1: with error nil, assume data exists
//                    // Assumption 2: data is in json format
//
//                    //decode JSON
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do {
//                            let results = try decoder.decode([StateData].self, from: safeData)
//
//                            DispatchQueue.main.async {
//                                self.stateDataList = results
//                            }
//                        }
//                        catch {
//                            print(error)
//                            print(error.localizedDescription)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
    } // end fetchData()
    
} // end class
