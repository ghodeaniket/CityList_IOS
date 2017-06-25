//
//  CityManager.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 24/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import Foundation

class CityManager {
    
    // private static cities which conforms to Monostate Design pattern since same cities vaiable will be available across the application life cycle
    
    private static var cities = [City] ()
    
    func addCity(city: City) {
        CityManager.cities.append(city)
    }
    
    func getCitiesCount() -> Int {
        return CityManager.cities.count
    }
    
    func cityAtIndex(index: Int) -> City {
        return CityManager.cities[index]
    }
    
    // Sort cities list by cities, country
    
    func sortCitiesList() {
        CityManager.cities.sort(by: {
            return ($0.country, $0.name) < ($1.country, $1.name)
        })
    }
}
