//
//  CityManagerTests.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 26/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import XCTest
@testable import CityList_IOS


class CityManagerTests: XCTestCase {
    
    var sut = CityManager()
    var city1: City!
    var city2: City!
    var city3: City!
    var city4: City!
    var city5: City!
    
    
    override func setUp() {
        
        super.setUp()
    
        intialSetup()
    }
    
    func intialSetup() {
        let city1Dictionary = ["country":"US", "name":"Alabama", "_id":707860, "coord": ["lon":34.283333, "lat":44.549999 ]] as [String : Any]
        
        let city1 = City(json: city1Dictionary)
        
        let city2Dictionary = ["country":"US", "name":"Albuquerque", "_id":707860, "coord": ["lon":34.283333, "lat":44.549999 ]] as [String : Any]
        
        let city2 = City(json: city2Dictionary)
        
        let city3Dictionary = ["country":"US", "name":"Anaheim", "_id":707860, "coord": ["lon":34.283333, "lat":44.549999 ]] as [String : Any]
        
        let city3 = City(json: city3Dictionary)
        
        let city4Dictionary = ["country":"US", "name":"Arizona", "_id":707860, "coord": ["lon":34.283333, "lat":44.549999 ]] as [String : Any]
        
        let city4 = City(json: city4Dictionary)
        
        let city5Dictionary = ["country":"Australia", "name":"Sydney", "_id":707860, "coord": ["lon":34.283333, "lat":44.549999 ]] as [String : Any]
        
        let city5 = City(json: city5Dictionary)
        
        sut.addCity(city: city1)
        sut.addCity(city: city2)
        sut.addCity(city: city3)
        sut.addCity(city: city4)
        sut.addCity(city: city5)
        
        sut.sortCitiesList()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        sut.removeAllCities()
    }
    
    func testIfCitiesAreFilteredWithWithA() {
        sut.filterCityList(searchText: "A")
        XCTAssertEqual(sut.getCitiesCount(isFilterEnabled: true), 4)
    }
    
    func testIfCitiesAreFilteredWithAl() {
        sut.filterCityList(searchText: "Al")
        
        XCTAssertEqual(sut.getCitiesCount(isFilterEnabled: true), 2)
    }
    
    func testIfCitiesAreFilteredWithAlb() {
        sut.filterCityList(searchText: "Alb")
        
        XCTAssertEqual(sut.getCitiesCount(isFilterEnabled: true), 1)
    }
    
    func testFilterCitiesWithEmptyFilter() {
        sut.filterCityList(searchText: " ")
        XCTAssertEqual(sut.getCitiesCount(isFilterEnabled: true), 0)
    }
    
}
