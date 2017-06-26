//
//  CitiesListViewController.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 25/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

//MARK: - UIViewController

class CitiesListViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var searchController: UISearchController!
    let cityListProvider = CityListDataProvider()
    
    let cityManager = CityManager()
    let cellIdentifier = "cities"
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSearchController()
                
        cityListProvider.loadCitiesFromJSONFile { (error) in
            if (error == nil) {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    //MARK: - Helpers
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

}

//MARK: - UITableViewDataSource

extension CitiesListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var isFilterEnabled = false
        if let searchText = searchController.searchBar.text {
            if !searchText.isEmpty {
                isFilterEnabled = true
            } else {
                isFilterEnabled = false
            }
        }else {
            isFilterEnabled = false
        }
        return cityManager.getCitiesCount(isFilterEnabled: isFilterEnabled)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        var isFilterEnabled = false
        if let searchText = searchController.searchBar.text {
            if !searchText.isEmpty {
                isFilterEnabled = true
            }
            else {
                isFilterEnabled = false
            }
        } else {
            isFilterEnabled = false
        }
        
        let city = cityManager.cityAtIndex(index: indexPath.row, isFilterEnabled: isFilterEnabled)
        
        cell.textLabel?.text = "\(city.name), \(city.country)"
        return cell
    }
}

//MARK: - UITableViewDataSource

extension CitiesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if !searchText.isEmpty {
                cityManager.filterCityList(searchText: searchText)
            }
            
            // Reload TableView everytime there is update in Searchbar to get updates when there is text in searchbar, but also get update when text is cleared.
            
            tableView.reloadData()
            
        }
        
    }
}
