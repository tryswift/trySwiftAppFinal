//
//  WorkshopSession.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

struct WorkshopSessionViewModel: SessionDisplayable {
    
    private let session: Session
    private let dataDefaults: SessionDataDefaults
    
    init?(_ session: Session) {
        if session.type == .workshop {
            self.session = session
            self.dataDefaults = SessionDataDefaults(session: session)
        } else {
            return nil
        }
    }
    
    var title: String {
        guard let event = session.event else { return dataDefaults.title }
        return event.localizedTitle
    }
    
    var presenter: String {
        if let sponsor = session.sponsor {
            return sponsor.localizedName
        }
        return dataDefaults.presenter
    }
    
    var imageURL: URL {
        if let imageURL = dataDefaults.customImageAssetURL {
            return imageURL
        }
        
        if let event = session.event {
            return event.logoURL
        }
        
        return dataDefaults.imageURL
    }
    
    var location: String {
        if let event = session.event {
            return event.localizedLocation
        }
        
        return dataDefaults.location
    }
    
    var shortDescription: String {
        return "Special Event".localized()
    }
    
    var longDescription: String {
        return dataDefaults.longDescription
    }
    
    var selectable: Bool {
        return session.event != nil
    }
    
    var twitter: String {
        let twitter = session.sponsor?.twitter ?? dataDefaults.twitter
        return "@\(twitter)"
    }
}
