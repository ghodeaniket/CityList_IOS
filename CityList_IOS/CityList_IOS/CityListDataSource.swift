//
//  CityListDataSource.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 25/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

class CityListDataSource: NSObject, UITableViewDataSource {
    
    let cityManager = CityManager()
    let cellIdentifier = "cities"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityManager.getSortedCities().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let city = cityManager.cityAtIndex(index: indexPath.row)
        cell.textLabel?.text = "\(city.name), \(city.country)"
        return cell
    }
}
