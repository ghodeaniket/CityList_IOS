//
//  CityListDataProvider.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 24/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

// Class responsible for fetching the data from JSON and passing the data to CityManager

class CityListDataProvider: NSObject {
    
    //MARK: - Aliases
    
    typealias JSONDictionary = [String : Any]
    typealias JSONArray = [JSONDictionary]
    
    //MARK: - Constants
    
    let jsonFileName = "cities"
    
    //MARK: - Properties
    
    let cityManager = CityManager()
    
    // Parsing JSON to City objects for fast enumeration for tableview (Display) and fast searching with the help of NSPredicate

    // I thought of Parsing JSON into hashable dictionary, but found out that parsing this huge JSON into hashable dictionary is time consuming 
    // And combination of array for displaying list of cities and filtering in with NSPredicate is fast.
    
    func loadCitiesFromJSONFile(completion: @escaping (Error?) -> Void) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            // read the json file
            
            // Create Error object with errorString
            func sendError(errorMessage: String) {
                let userInfo = [NSLocalizedDescriptionKey : errorMessage]
                completion(NSError(domain: "JSON Parsing", code: 1, userInfo: userInfo))
            }
            
            guard let url = Bundle.main.url(forResource: self.jsonFileName, withExtension: "json") else {
                sendError(errorMessage: "JSON file not found")
                return
            }
            
            guard let data = try? Data(contentsOf: url) else {
                sendError(errorMessage: "Error with JSON data")
                return
            }
            
            guard let cityArrayJson = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSONArray else {
                sendError(errorMessage: "Unable to Parse JSON")
                return
            }
            
            if let cityArrayJson = cityArrayJson {
                for cityJSON in cityArrayJson {
                    let city = City(json: cityJSON)
                    self.cityManager.addCity(city: city)
                }
            }
            self.cityManager.sortCitiesList()
            completion(nil)
        }
        
        
    }
}
