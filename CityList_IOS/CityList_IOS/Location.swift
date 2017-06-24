//
//  Location.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 24/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import Foundation

struct Location {
    let longitude: Double
    let latitude: Double
    
    init(json: [String: Any]) {
        longitude = json["lon"] as? Double ?? 0.0
        latitude = json["lat"] as? Double ?? 0.0
    }
}
