//
//  SessionDisplayableProtocol.swift
//  Pods
//
//  Created by Natasha Murashev on 3/23/17.
//
//

protocol SessionDisplayable {
    
    /** The main name of this session */
    var title: String { get }
    
    /** Who is in charge of this session */
    var presenter: String { get }
    
    /** What image, if any is available for this session */
    var imageURL: URL { get }
    
    /** The location for where this session will occur */
    var location: String { get }
    
    /** A short-form description of the session */
    var shortDescription: String { get }
    
    /** A long-form description of the session */
    var longDescription: String { get }
    
    /** What Twitter handle, if any represents this session */
    var twitter: String { get }
    
    /** Whether this type of session requires a new view controller to display more information */
    var selectable: Bool { get }
}

