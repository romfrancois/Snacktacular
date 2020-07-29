//
//  SpotTableViewCell.swift
//  Snacktacular
//
//  Created by Romain Francois on 27/07/2020.
//  Copyright © 2020 Romain Francois. All rights reserved.
//

import UIKit
import CoreLocation

class SpotTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var currentLocation: CLLocation!
    
    var spot: Spot! {
        didSet {
            nameLabel.text = spot.name
            ratingLabel.text = "Avg. Rating: \(spot.averageRating)"
            
            guard let currentLocation = currentLocation else {
                distanceLabel.text = "Distance: -.-"
                return
            }
            
            let distanceInMeters = spot.location.distance(from: currentLocation)
//            let distanceInMiles = ((distanceInMeters * 0.00062137) * 10).rounded() / 10
            let distanceInKm = ((distanceInMeters / 1000) * 10).rounded() / 10
            distanceLabel.text = "Distance: \(distanceInKm)"
        }
    }
}
