//
//  CityManager.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 24/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import Foundation

class CityManager {
    private var cities = [City] ()
    
    func addCity(city: City) {
        cities.append(city)
    }
    
    func cityAtIndex(index: Int) -> City {
        return cities[index]
    }
}
