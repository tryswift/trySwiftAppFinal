//
//  PartySessionViewModel.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

struct PartySessionViewModel: SessionDisplayable {
    
    private let session: Session
    private let dataDefaults: SessionDataDefaults
    
    init?(_ session: Session) {
        if session.type == .party {
            self.session = session
            self.dataDefaults = SessionDataDefaults(session: session)
        } else {
            return nil
        }
    }
    
    var title: String {
        return dataDefaults.title
    }
    
    var presenter: String {
        return dataDefaults.presenter
    }
    
    var imageURL: URL {
        return dataDefaults.customImageAssetURL ?? dataDefaults.imageURL
    }
    
    var location: String {
        return session.venue!.localizedTitle
    }
    
    var shortDescription: String {
        return "🎉🎉🎉".localized()
    }
    
    var longDescription: String {
        return dataDefaults.longDescription
    }
    
    
    var selectable: Bool {
        return true
    }
    
    var twitter: String {
        return "@\(dataDefaults.twitter)"
    }
}
