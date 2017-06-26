//
//  CitiesListDataSource.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 26/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

//MARK: - UITableViewDataSource

extension CitiesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityManager.getCitiesCount(isFilterEnabled: isFilterEnabled())
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        let city = cityManager.cityAtIndex(index: indexPath.row, isFilterEnabled: isFilterEnabled())
        
        cell.textLabel?.text = "\(city.name), \(city.country)"
        return cell
    }
    
    // helper function to check if text is present in searchbar or not.
    // Based on this the datasource can decide whether to use filtered cities or not.
    
    func isFilterEnabled() -> Bool {
        if let searchText = searchController.searchBar.text {
            if !searchText.isEmpty {
                return true
            }
            else {
                return false
            }
        } else {
            return false
        }
    }
}
