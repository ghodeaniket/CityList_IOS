//
//  CitiesListSearchUpdater.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 26/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

//MARK: - UISearchResultsUpdating

extension CitiesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            
            // check if searchtext is empty or not
            if !searchText.isEmpty {
                cityManager.filterCityList(searchText: searchText)
            }
            
            // Reload TableView everytime there is update in Searchbar to get updates when there is text in searchbar, but also get update when text is cleared.
            
            tableView.reloadData()
        }
    }
}
