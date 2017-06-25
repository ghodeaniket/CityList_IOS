//
//  CitiesListViewController.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 25/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit

class CitiesListViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var searchController: UISearchController!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSearchController()
    }
    
    //MARK: - Helpers
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

}
