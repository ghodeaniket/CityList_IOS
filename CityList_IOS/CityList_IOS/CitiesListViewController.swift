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
        
        // Show activity indicator when cities.json is being parsed 
        
        ActivityIndicator.sharedInstance().startActivityIndicator(self)
        cityListProvider.loadCitiesFromJSONFile { (error) in
            DispatchQueue.main.async {
                ActivityIndicator.sharedInstance().stopActivityIndicator(self)
                if (error == nil) {
                    self.tableView.reloadData()
                } else {
                    self.displayError(error!.localizedDescription)
                }
            }
        }
    }
    
    //MARK: - Helpers
    
    // Configure the UISearchController
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    // display an error if something goes wrong
    fileprivate func displayError(_ errorString: String?) {
        
        let alertController = UIAlertController(title: "Error", message: errorString, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

