//
//  SessionViewModel.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

public struct SessionViewModel: SessionDisplayable {
    
    private let displayble: SessionDisplayable
    
    public init(session: Session) {
        switch session.type {
        case .workshop:
            displayble = WorkshopSessionViewModel(session)!
        case .meetup:
            displayble = MeetupSessionViewModel(session)!
        case .breakfast:
            displayble = BreakfastSessionViewModel(session)!
        case .announcement:
            displayble = AnnouncementSessionViewModel(session)!
        case .talk:
            displayble = TalkSessionViewModel(session)!
        case .lightningTalk:
            displayble = LightningTalkSessionViewModel(session)!
        case .sponsoredDemo:
            displayble = SponsoredDemoSessionViewModel(session)!
        case .coffeeBreak:
            displayble = CoffeeBreakSessionViewModel(session)!
        case .lunch:
            displayble = LunchSessionViewModel(session)!
        case .officeHours:
            displayble = OfficeHoursSessionViewModel(session)!
        case .party:
            displayble = PartySessionViewModel(session)!
        }
    }
    
    public var title: String { return displayble.title }
    
    public var presenter: String { return displayble.presenter }
    
    public var imageURL: URL { return displayble.imageURL }
    
    public var location: String { return displayble.location }
    
    public var shortDescription: String { return displayble.shortDescription }
    
    public var longDescription: String { return displayble.longDescription }
    
    public var twitter: String { return displayble.twitter }
    
    public var selectable: Bool { return displayble.selectable }
    
}
