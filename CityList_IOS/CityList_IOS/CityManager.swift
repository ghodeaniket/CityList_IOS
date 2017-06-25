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
    private static var filteredCities = [City] ()
    
    func addCity(city: City) {
        CityManager.cities.append(city)
    }
    
    // Helper methods for TableView DataSource
    
    func getCitiesCount(isFilterEnabled: Bool = false) -> Int {
        if isFilterEnabled {
            return CityManager.filteredCities.count
        }
        return CityManager.cities.count
    }
    
    func cityAtIndex(index: Int, isFilterEnabled: Bool = false) -> City {
        if isFilterEnabled {
            return CityManager.filteredCities[index]
        }
        return CityManager.cities[index]
    }
    
    func filterCityList(searchText: String) {
        
        let predicate = NSPredicate { (city, _) -> Bool in
            return (city as! City).name.hasPrefix(searchText)
        }
        CityManager.filteredCities = (CityManager.cities as NSArray).filtered(using: predicate) as! [City]
        print(CityManager.filteredCities.count)
    }
    
    // Sort cities list by cities, country
    
    func sortCitiesList() {
        CityManager.cities.sort(by: {
            return $0.name < $1.name
        })
    }
}
