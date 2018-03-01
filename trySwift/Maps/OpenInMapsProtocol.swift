//
//  OpenInMapsProtocol.swift
//  trySwift
//
//  Created by Sash Zats on 3/2/18.
//  Copyright © 2018 NatashaTheRobot. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Contacts

protocol OpenInMapsDelegate: class {
  func openInMaps(placemark: MKPlacemark, allowCopy: Bool)
}

extension UIViewController: OpenInMapsDelegate {
  func openInMaps(placemark: MKPlacemark, allowCopy: Bool) {
    showMapSelectionAlertIfNeeded(placemark, allowCopy: allowCopy)
  }

  private func showMapSelectionAlertIfNeeded(_ placemark: MKPlacemark, allowCopy: Bool) {
    // always show alert if we have more than 1 option
    if allowCopy || UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!) {
      showMapSelectionAlert(placemark: placemark, allowCopy: allowCopy)
    } else {
      openInAppleMaps(placemark)
    }
  }

  private func showMapSelectionAlert(placemark: MKPlacemark, allowCopy: Bool) {
    let alert = UIAlertController(title: "Open in", message: nil, preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "Apple Maps", style: .default) { _ in
      self.openInAppleMaps(placemark)
    })

    alert.addAction(UIAlertAction(title: "Google Maps", style: .default) { _ in
      self.openInGoogleMaps(placemark)
    })

    if allowCopy {
      alert.addAction(UIAlertAction(title: "Copy Address", style: .default) { _ in
        if let postalAddress = placemark.postalAddress {
          let formatter = CNPostalAddressFormatter()
          let address = formatter.string(from: postalAddress)
          UIPasteboard.general.string = address
        } else {
          assertionFailure("No address found for the placemark \(placemark)")
          UIPasteboard.general.string = "\(placemark.coordinate.latitude), \(placemark.coordinate.longitude)"
        }
      })
    }

    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

    present(alert, animated: true, completion: nil)

  }

  private func openInAppleMaps(_ placemark: MKPlacemark) {
    MKMapItem(placemark: placemark).openInMaps(launchOptions: nil)
  }

  private func openInGoogleMaps(_ placemark: MKPlacemark) {
    UIApplication.shared.open(URL(string:
      "comgooglemaps-x-callback://" +
      "?daddr=\(placemark.coordinate.latitude),\(placemark.coordinate.longitude)")!)
  }
}
