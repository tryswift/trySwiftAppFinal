//
//  MapTableViewCell.swift
//  trySwift
//
//  Created by Natasha Murashev on 8/13/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {

    @IBOutlet weak var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withAddress address: String) {
        let location = address
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { [weak self] placemarks, error in
            guard let placemark = placemarks?.first, let location = placemark.location else { return }
            let mark = MKPlacemark(placemark: placemark)
            let viewRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 500, longitudeDelta: 500))
            self?.mapView.setRegion(viewRegion, animated: true)
            self?.mapView.addAnnotation(mark)
        }

    }
    
}
