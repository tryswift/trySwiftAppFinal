//
//  PanelSessionViewModel.swift
//  TrySwiftData-TrySwiftData
//
//  Created by Natasha Murashev on 6/4/18.
//

import Foundation

struct PanelSessionViewModel: SessionDisplayable {
    
    private let session: Session
    private let dataDefaults: SessionDataDefaults
    
    init?(_ session: Session) {
        if session.type == .panel {
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
        return dataDefaults.location
    }
    
    var shortDescription: String {
        return "🎤".localized()
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
