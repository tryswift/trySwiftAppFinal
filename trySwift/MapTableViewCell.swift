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

    private weak var placemark: MKPlacemark?
    private weak var delegate: OpenInMapsDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapGesture(_:))))
        self.contentView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(onLongPressGesture(_:))))
    }
    
    @objc func onTapGesture(_ sender: Any) {
        if let placemark = placemark {
            self.delegate?.openInMaps(placemark: placemark, allowCopy: false)
        }
    }
  
    @objc func onLongPressGesture(_ sender: Any) {
        if let placemark = placemark {
            self.delegate?.openInMaps(placemark: placemark, allowCopy: true)
        }
    }

    func configure(withAddress address: String, delegate: OpenInMapsDelegate) {
        let location = address
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { [weak self] placemarks, error in
            guard let placemark = placemarks?.first, let location = placemark.location else { return }
            let mark = MKPlacemark(placemark: placemark)
            let viewRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            self?.mapView.setRegion(viewRegion, animated: true)
            self?.mapView.addAnnotation(mark)          
            self?.placemark = mark
        }
        self.delegate = delegate
    }
}
