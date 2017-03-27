//
//  OfficeHoursSessionViewModel.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

struct OfficeHoursSessionViewModel: SessionDisplayable {
    
    private let session: Session
    private let dataDefaults: SessionDataDefaults
    
    init?(_ session: Session) {
        if session.type == .officeHours {
            self.session = session
            dataDefaults = SessionDataDefaults(session: session)
        } else {
            return nil
        }
    }
    
    var title: String {
        guard let speaker = session.presentation?.speaker?.localizedName else {
            return "Office Hours".localized()
        }
        return String(format: "Office Hours with %@".localized(), speaker)
    }
    
    var presenter: String {
        if let presentation = session.presentation {
            return presentation.speaker?.localizedName ?? "⁉️"
        }
        return "⁉️"
    }
    
    var imageURL: URL {
        if let imageURL = dataDefaults.customImageAssetURL {
            return imageURL
        }
        
        if let speakerImage = session.presentation?.speaker?.imageURL {
            return speakerImage
        }
        
        return dataDefaults.imageURL
    }
    
    var location: String {
        return dataDefaults.location
    }
    
    var shortDescription: String {
        return "Q&A".localized()
    }
    
    var longDescription: String {
        return session.presentation?.speaker?.localizedBio ?? dataDefaults.longDescription
    }
    
    var selectable: Bool {
        return true
    }
    
    var twitter: String {
        let twitter = session.presentation?.speaker?.twitter ?? dataDefaults.twitter
        return "@\(twitter)"
    }

}
