//
//  TalkSessionViewModel.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

struct TalkSessionViewModel: SessionDisplayable {

    private let session: Session
    private let dataDefaults: SessionDataDefaults
    
    private let presentation: Presentation
    
    init?(_ session: Session) {
        if session.type == .talk {
            self.session = session
            dataDefaults = SessionDataDefaults(session: session)
            presentation = session.presentation!
        } else {
            return nil
        }
    }
    
    var title: String {
        return presentation.localizedTitle
    }
    
    var presenter: String {
        return presentation.speaker?.localizedName ?? "TBD"
    }
    
    var imageURL: URL {
        if let imageURL = dataDefaults.customImageAssetURL {
            return imageURL
        }
        
        if let speakerImage = presentation.speaker?.imageURL {
            return speakerImage
        }
        
        return dataDefaults.imageURL
    }
    
    var location: String {
        return dataDefaults.location
    }
    
    var shortDescription: String {
        return "Presentation".localized()
    }
    
    var longDescription: String {
        return presentation.localizedSummary ?? dataDefaults.longDescription
    }
    
    var selectable: Bool {
        return true
    }
    
    var twitter: String {
        let twitter = presentation.speaker?.twitter ?? dataDefaults.twitter
        return "@\(twitter)"
    }
}
