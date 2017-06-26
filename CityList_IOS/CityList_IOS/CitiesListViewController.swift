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

