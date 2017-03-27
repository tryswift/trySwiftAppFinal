//
//  LunchSessionViewModel.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

struct LunchSessionViewModel: SessionDisplayable {
    
    private let session: Session
    private let dataDefaults: SessionDataDefaults
    
    init?(_ session: Session) {
        if session.type == .lunch {
            self.session = session
            self.dataDefaults = SessionDataDefaults(session: session)
        } else {
            return nil
        }
    }
    
    var title: String {
        return "Lunch".localized()
    }
    
    var presenter: String {
        return dataDefaults.presenter
    }
    
    var imageURL: URL {
        return dataDefaults.customImageAssetURL ?? dataDefaults.imageURL
    }
    
    var location: String {
        return dataDefaults.location
    }
    
    var shortDescription: String {
        return dataDefaults.shortDescription
    }
    
    var longDescription: String {
        return dataDefaults.longDescription
    }
    
    var selectable: Bool {
        return false
    }
    
    var twitter: String {
        return "@\(dataDefaults.twitter)"
    }
}
