//
//  NetworkManager.swift
//  CovidCountsApp
//
//  Created by Joel Sereno on 10/10/21.
//

import Foundation
import SwiftUI

final class NetworkManager {
    
    //create a singleton for usage
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

            //check data
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

    } // end fetchData()
    
} // end class
