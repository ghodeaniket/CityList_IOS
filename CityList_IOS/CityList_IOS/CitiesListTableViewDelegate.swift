//
//  CitiesListTableViewDelegate.swift
//  CityList_IOS
//
//  Created by Aniket Ghode on 26/06/17.
//  Copyright © 2017 Aniket Ghode. All rights reserved.
//

import UIKit
import MapKit

extension CitiesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = cityManager.cityAtIndex(index: indexPath.row, isFilterEnabled: isFilterEnabled())
        
        // Created CLLocationCoordinate object from location values
        let coordinate = CLLocationCoordinate2D(latitude: city.location.latitude, longitude: city.location.longitude)
        let placemark = MKPlacemark(coordinate: coordinate)
        
        // Created MKMapItem with location and name which can be shown in a Map
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "\(city.name), \(city.country)"
        
        // Open Maps and add the Pin on map with selected location and name of the city
        mapItem.openInMaps(launchOptions: nil)
    }
}
