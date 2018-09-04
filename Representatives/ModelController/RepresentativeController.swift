//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Quinten Smith on 9/3/18.
//  Copyright © 2018 Quinten Smith. All rights reserved.
//

import UIKit

class RepresentativeController {
    
    // Singleton
    static let shared = RepresentativeController()
    
    // https://whoismyrepresentative.com/getall_reps_bystate.php?state=CA&output=json
    
    private let baseURLString = "https://whoismyrepresentative.com"
    
    func searchRepresentatives(forState state: String, completion : @escaping ([Representative]?) -> Void) {
        guard let baseURL = URL(string: baseURLString) else {
            fatalError("Bad base URL")
        }
        
        let newURL = baseURL.appendingPathComponent("getall_reps_bystate.php")
        
        // Build URL
        var components = URLComponents(url: newURL, resolvingAgainstBaseURL: true)
        let queryStates = URLQueryItem(name: "state", value: state)
        let queryOutput = URLQueryItem(name: "output", value: "json")
        
        components?.queryItems = [queryStates, queryOutput]
        
        //The final URL Request
        guard let url = components?.url else { completion([]); return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("There was an error fetching from datasource \(#function) \(error) \(error.localizedDescription)")
                completion([]); return }
            
            
        
        guard let data = data else {
            print("No Data returned"); completion([]); return }
            let asciiStringFromData = String(data: data, encoding: .ascii)
            let dataAsUTF8 = Data(asciiStringFromData!.utf8)
            
            do {
                let results = try JSONDecoder().decode(RepresentativeDictionary.self, from: data).results
                completion(results)
            } catch let error {
                print("There was an error decoding our object \(error) \(error.localizedDescription)")
                completion([]);return
            }
            
            }.resume()
    }
    
    
}

