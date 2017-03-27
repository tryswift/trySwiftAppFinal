//
//  CoffeeBreakSessionViewModel.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

struct CoffeeBreakSessionViewModel: SessionDisplayable {
    
    private let session: Session
    private let dataDefaults: SessionDataDefaults
    
    init?(_ session: Session) {
        if session.type == .coffeeBreak {
            self.session = session
            self.dataDefaults = SessionDataDefaults(session: session)
        } else {
            return nil
        }
    }
    
    var title: String {
        if let sponsor = session.sponsor {
            return String(format: "Coffee Break, by %@".localized(), sponsor.name)
        }
        return "Coffee Break".localized()
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
        
        if let sponsor = session.sponsor {
            return sponsor.logoURL
        }
        
        return dataDefaults.imageURL
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
        return session.sponsor != nil
    }
    
    var twitter: String {
        let twitter = session.sponsor?.twitter ?? dataDefaults.twitter
        return "@\(twitter)"
    }
}
