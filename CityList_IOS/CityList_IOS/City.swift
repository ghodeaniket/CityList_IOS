//
//  City.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 24/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import Foundation

struct City{
    let name: String
    let country: String
    let id: Int
    let location: Location
}

//MARK: - Protocols

extension City : Equatable{
    public static func ==(lhs: City, rhs: City) -> Bool{
        return (lhs.name == rhs.name) &&
            (lhs.country == rhs.country)
    }
}

