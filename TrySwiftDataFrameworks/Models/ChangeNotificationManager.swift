//
//  ChangeNotificationManager.swift
//  TrySwiftData
//
//  Created by Natasha Murashev on 9/25/16.
//  Copyright © 2016 Natasha Murashev. All rights reserved.
//

import RealmSwift

public class ChangeNotificationManager {
    
    public typealias onDataChange = () -> Void
    
    fileprivate var presentationsToken: NotificationToken? = nil
    fileprivate var speakersToken: NotificationToken? = nil
    
    public init() { }
    
    deinit {
        presentationsToken?.stop()
        speakersToken?.stop()
    }
    
    public func subscribeToPresenationChange(_ onDataChange: @escaping onDataChange) {
        presentationsToken = Presentation.presentations.addNotificationBlock { (changes: RealmCollectionChange) in
            switch changes {
            case .update(_, _, _, _):
                onDataChange()
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            default:
                break
            }
        }
    }
    
    public func subscribeToSpeakerChange(_ onDataChange: @escaping onDataChange) {
        speakersToken = Speaker.speakers.addNotificationBlock { (changes: RealmCollectionChange) in
            switch changes {
            case .update(_, _, _, _):
                onDataChange()
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            default:
                break
            }
        }
    }
}
