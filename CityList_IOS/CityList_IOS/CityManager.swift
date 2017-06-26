//
//  CityManager.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 24/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import Foundation

// Common access point for getting the cities information to display and search.
// The reason I followed Monostate over Singleton because it solves the issue of singular nature of class which is transparent to user of this class.

class CityManager {
    
    // private static cities which conforms to Monostate Design pattern since same cities vaiable will be available across the application life cycle
    
    private static var cities = [City] ()
    private static var filteredCities = [City] ()
    
    // Helper function to add City to cities array
    
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
    
    // Helper function to filter list of cities based on whether city name starts with search string or not.
    
    func filterCityList(searchText: String) {
        
        let predicate = NSPredicate { (city, _) -> Bool in
            return (city as! City).name.hasPrefix(searchText)
        }
        CityManager.filteredCities = (CityManager.cities as NSArray).filtered(using: predicate) as! [City]
        print(CityManager.filteredCities.count)
    }
    
    // Helper function for unit testing to reset the 'System Under Test'
    
    func removeAllCities() {
        CityManager.cities.removeAll()
        CityManager.filteredCities.removeAll()
    }
    
    // Sort cities list by cities, country
    
    func sortCitiesList() {
        CityManager.cities.sort(by: {
            return $0.name < $1.name
        })
    }
}
