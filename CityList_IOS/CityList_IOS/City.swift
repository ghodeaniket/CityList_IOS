//
//  City.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 24/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import Foundation

// Structure to hold the information for city from cities.json

struct City{
    let name: String
    let country: String
    let id: Int
    let location: Location
    
    init(json: [String: Any]) {
        name = json["name"] as? String ?? "Unknown City"
        country = json["country"] as? String ?? "Unknown Country"
        id = json["_id"] as? Int ?? 0
        location = Location(json: json["coord"] as! [String : Any])
    }
}

//MARK: - Protocols

extension City : Equatable{
    public static func ==(lhs: City, rhs: City) -> Bool{
        return (lhs.name == rhs.name) &&
            (lhs.country == rhs.country)
    }
}

