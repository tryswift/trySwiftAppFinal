//
//  Presentation.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift

public class Presentation: Object {
    public dynamic var id: Int = 0
    public dynamic var title: String = "TBD"
    public dynamic var summary: String = "TBD"
    public dynamic var speaker: Speaker?
    
    public override static func primaryKey() -> String? {
        return "id"
    }
    
    public override static func indexedProperties() -> [String] {
        return ["id"]
    }
    
    public class var presentations: Results<Presentation> {
        let realm = try! Realm()
        return realm.objects(Presentation.self)
    }
}

public extension Presentation {
    
    class func insertDefaultPresentations() {
        guard Presentation.presentations.isEmpty else { return }
        let realm = try! Realm()
        try! realm.write {
            defaultPresentations.forEach {
                realm.add($0)
            }
        }
    }
}

public let defaultPresentations: [Presentation] = [
    {
        let presentation = Presentation()
        presentation.id = 1
        presentation.title = "Pushing the Envelope with iOS 10 Notifications"
        presentation.summary = "Apple made major changes to the Notification APIs in iOS 10, affecting both Push and Local notifications. In this session, you'll get a high-level overview on what's changed, what you need to do to make sure your existing apps keep working, a few pitfalls to avoid during the transition, and some examples of the cool stuff you can do with the new toys."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 1").first
        presentation.speaker = speaker ?? defaultSpeakers[0]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 2
        presentation.title = "Say It Ain't So: Implementing Speech Recognition in your app"
        presentation.summary = "SiriKit was one of the more talked about features announced at WWDC this year; unfortunately its initial implementation is limited to a small number of use cases. But all is not lost! Apple introduced a collection of general purpose Speech API's in iOS 10 that provide simple speech-to-text conversion from streaming voice or audio files in over 50 languages. \n\nIn this talk I will walk through the new API's, discuss its limitations and end with providing a practical use case by adding speech recognition to a text-based search app."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 2").first
        presentation.speaker = speaker ?? defaultSpeakers[1]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 3
        presentation.title = "Lambda: There and Back Again"
        presentation.summary = "I have been to Monad, to the Functor of Doom. I have seen the map, flattened and lensed. I have folded the infinite, lifted a Maybe, and I’d do it all over again. But from what I’ve seen, from Haskell to Church, we can rely on one truth, which is this: Swift is not a functional programming language. Pushing too hard to make it one fights Swift and breaks Cocoa. But Swift has absorbed some fantastic lessons from the functional world, and while value types may not quite be the present, they are clearly the future. \n\nWe’ll explore how decades of work in functional languages have influenced Swift, and how you can use those features best while staying true to Swift, playing nice with Cocoa, and embracing Protocol Oriented Programming."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 3").first
        presentation.speaker = speaker ?? defaultSpeakers[2]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 4
        presentation.title = "Real World Swift Performance"
        presentation.summary = "Lots of things can make your application slow, in this talk we're going to explore application performance from the bottom. Looking at the real world performance impact of Swift features (Protocols, Generics, Structs, and Classes) in the context of data parsing, mapping, and persistence, we will identify the key bottlenecks as well as the performance gains that Swift gives us."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 4").first
        presentation.speaker = speaker ?? defaultSpeakers[3]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 5
        presentation.title = "Random Talk: The Consistent World of Noise"
        presentation.summary = "Chance permeates our human existence - but it’s our instinct to seek order in chaos. In this talk, we’ll explore the fishy realm of randomness, and when it’s just too unnatural for our apps - let’s bend it to our will by making it evolve into coherent patterns with the GameplayKit framework. We’ll use the latest iOS 10 APIs and procedural noise to generate harmonious digital worlds, landscapes and textures - a comforting way to mine some creativity from silicon chips."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 5").first
        presentation.speaker = speaker ?? defaultSpeakers[4]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 6
        presentation.title = "Swift eye for the Stringly typed API"
        presentation.summary = "With the upcoming release of the third major version of Swift, massive improvements are coming to the language and we are beginning to see the chains being broken on some of shackles of Objective-C’s legacy. However a lot of these improvements still rely on “Stringly typed” APIs which have the potential to trip us up when developing apps. In this talk we are going to look into how we can avoid using these APIs by replacing them with alternatives that make our code more readable, safer, intentional and Swifty."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 6").first
        presentation.speaker = speaker ?? defaultSpeakers[5]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 7
        presentation.title = "Driving User Engagement with watchOS 3"
        presentation.summary = "One of the most interesting aspects of the Apple Watch is the fact that it is a new opportunity to engage with and delight your users. What’s different about these interactions, compared to the phone, is that they should be as short as possible - 2 seconds! What can you do in 2 seconds?! Using complications, notifications, and quick access to apps in memory, we’ll take a look at not only how to create and use each of these features on the watch, but also the best way to delight your users with each! \n\nAfter attending this talk, you’ll walk away with some new strategies on how to increase your app’s indispensability through these awesome watch features."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 7").first
        presentation.speaker = speaker ?? defaultSpeakers[6]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 8
        presentation.title = "Architectural Superpowers"
        presentation.summary = "We usually hear about intangible or difficult to measure benefits of implementing a good architecture. I would like to prove to you that the benefits are far more mundane. In this talk I will showcase practical, real world examples of how a good architecture for your application makes your life easier. Using my interpretation of the Clean Architecture for iOS in Swift, I will show how it helps to do things such as reusing an existing use case in another view controller, or using a different backend, in case we are forced to do so. I will also cover briefly how this architecture helps with testability."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 8").first
        presentation.speaker = speaker ?? defaultSpeakers[7]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 9
        presentation.title = "Building user-centric security model in iOS applications"
        presentation.summary = "In this presentation we will talk about building security, that does not fail when application keys are exposed; when servers are hacked; security that lasts as long as unique user's crypto keys (or passwords) are safe. Putting secrets known by user to be a source of trust is the ultimate way for app to become \"thin\" in relation to security model, thus lowering the risks and developer pain. We will learn about thin transparent security layers system and its applicability in client-server systems. And, of course, we'll cover some latest changes in ATS."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 9").first
        presentation.speaker = speaker ?? defaultSpeakers[8]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 10
        presentation.title = "Decoding JSON with Swift"
        presentation.summary = "As Swift's statically-typed characteristics prove to complicate the decoding of serialized objects, there are other characteristics that serve as interesting alternatives, like currying. In this talk, we will go through some of the functional aspects of Swift that make parsing JSON fun and exciting!"
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 10").first
        presentation.speaker = speaker ?? defaultSpeakers[9]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 11
        presentation.title = "Incremental Swift"
        presentation.summary = "What do you do when you’re ready to upgrade to Swift, but rewriting your existing Objective-C apps isn’t an option? Using Etsy as a case study, I'll discuss a blueprint for integrating Swift incrementally into your apps. Swift provides rich features for Objective-C interoperability, but applying them to your current codebase isn’t always straightforward. We’ll cover technical details, such as linting and managing dependencies, as well as organizational strategies for gathering support, and other things we’ve learned at Etsy along the way. You’ll be prepared for a smooth transition to Swift: both in your code and in your company."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 11").first
        presentation.speaker = speaker ?? defaultSpeakers[10]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 12
        presentation.title = "Building a Tiny Compiler"
        presentation.summary = "We all use compilers every day, but they still can seem like a mysterious black box at times. We're going to build a tiny compiler for a made-up language 100% from scratch to get a feel for the basics of how compilers work. We'll also look at some of the ways Swift can yield elegant solutions for complex problems such as parsing, lexing, and code generation. At the end, we'll have a working implementation of a brand-new programming language."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 12").first
        presentation.speaker = speaker ?? defaultSpeakers[11]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 13
        presentation.title = "Property-Based Testing with SwiftCheck"
        presentation.summary = "Unit tests are a challenge to write. \"Did I think of every relevant case?\" is an almost impossible question to answer. Fortunately, we have the tools to help find more relevant cases with less searching. Property based testing helps us find edge cases and become more confident about the assumptions that our code is built upon."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 14").first
        presentation.speaker = speaker ?? defaultSpeakers[13]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 14
        presentation.title = "Extending Xcode 8"
        presentation.summary = "Xcode 8 introduces a new mechanism for extending the source editor with app extensions. In this talk, you will learn more about the practical implications of developing Xcode extensions: how they are distributed, positive and negative tradeoffs of their design, and how to keep an extension's host app efficiently in sync with the extension itself."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 15").first
        presentation.speaker = speaker ?? defaultSpeakers[14]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 15
        presentation.title = "Designs for the Human Mind"
        presentation.summary = "Have you ever wondered why some interfaces are more “intuitive” than others? What makes one UI resonate with people while another doesn’t? This talk is meant to shed a bit more light on this mystery. In some ways the human mind is incredibly adaptable while in other ways it seems to be stuck in the stone ages. This dichotomy presents interesting obstacles and opportunities for those of us designing and building digital experiences for humans."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 16").first
        presentation.speaker = speaker ?? defaultSpeakers[15]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 16
        presentation.title = "Result Oriented Development"
        presentation.summary = "When I last talked about functional programming, we saw by using small, micro functions, a nasty, complex and hard to track function could eventually be written as a pipeline of smaller functions. But using only optionals to pipe functions together isn’t enough to take full advantage of this technique. With the help of a small, but useful Monad called Result (or Either) you can take your functional programming powers to the next level."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 17").first
        presentation.speaker = speaker ?? defaultSpeakers[16]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 17
        presentation.title = "I make iOS apps - is RxSwift for me?"
        presentation.summary = "It's difficult to make the jump from map and filter to say ... presenting view controllers or search bars that need to call an API on the web and populate a table view. To be honest, at first it seems almost like functional or reactive programming has nothing to do with UIKit or NSURLSession... In this talk Marin (me) will show you how RxSwift (an async, event based framework) applies in few every day situations of the life of an iOS developer. If you like major pains being solved for you transparently at the price of a single dependance this talk is for you."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 18").first
        presentation.speaker = speaker ?? defaultSpeakers[17]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 18
        presentation.title = "Building a Better Language App with Swift"
        presentation.summary = "As an elegant and powerful language, Swift offers developers the opportunity to create more engaging and enriching language learning experiences. Unfortunately, most language apps settle on a limited range of teaching techniques and approaches to UI design, with the result being shallow learning, less cultural understanding, and low user retention. We can do better. \n\nIn this talk, you’ll learn how to create more effective—and more human—language learning experiences for iOS. We’ll start by examining the essential teaching techniques that are missing from language apps; discuss how to pair these techniques with UI elements, choose features based on learning goals, and create more culturally-relevant UI designs; and then move on to some actual examples in Swift."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 19").first
        presentation.speaker = speaker ?? defaultSpeakers[18]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 19
        presentation.title = "Healthy Minds in a Healthy Community"
        presentation.summary = "Open source communities attract and boast passionate, idealistic people, and many of us invest copious amounts of time and effort to contribute to our projects and support our communities. This underlying emotional attachment can make us more vulnerable to elevated stress, burnout and conflicts. And then there are those of us who also manage mental illness. \n\nMore often than not, we suffer these struggles in silence, feeling (and fearing) that we’re alone in our trouble. Here, our communities can make a huge difference, by building a positive and safe environment where we can blossom and support ourselves and our peers, and feel included. \n\nThe community around Django, a common open-source web framework for Python, is already very mindful towards inclusivity, and keeping an eye on the well-being of community members. We have recently launched several new projects to further promote the well-being of our community members. \n\nThis talk will take a look at open-source communities through the eyes of various mental well-being issues and struggles, show various things that some communities already do and the new initiatives from the Django community. This will hopefully inspire more communities to help foster healthy minds in a healthy environment."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 20").first
        presentation.speaker = speaker ?? defaultSpeakers[19]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 20
        presentation.title = "Refactoring at scale – Lessons learned rewriting Instagram’s feed"
        presentation.summary = "When apps grow, there eventually comes a time where you hear the dreaded word “refactor”. For established apps, refactors present interesting problems from the amount of code and teams involved. Not to mention performance and testing implications on a large application. But no matter the size, there are common problems that any app runs into when taking on a big refactor. Things like massive view controllers, dependencies, and managing goals and priorities. \n\nCome learn about how and why the Instagram team took on rewriting their iOS feed from the bottom up, and see what it takes to ship a successful refactor."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 21").first
        presentation.speaker = speaker ?? defaultSpeakers[20]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 21
        presentation.title = "End-to-end application development in Swift"
        presentation.summary = "The addition of support for Swift as a server-side programming language makes it possible to use not just the same language on client and server, but also to reuse APIs and code. This session will introduce you to new models of client and server interaction for application development, and show you how to rapidly build an app with both client and server components written in Swift."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 27").first
        presentation.speaker = speaker ?? defaultSpeakers[26]
        
        return presentation
    }(),
    {
        let presentation = Presentation()
        presentation.id = 22
        presentation.title = "Making a Rich Text Editor in Swift"
        presentation.summary = "The handling of rich text is not easy. We may consider a lot of things like fonts, characters, glyphs, emojis, images, ligatures, etc. In this talk, I will show you the basics of laying out text and how to handle complex text layouts in Apple's OS."
        
        let realm = try! Realm()
        let speaker = realm.objects(Speaker.self).filter("id == 23").first
        presentation.speaker = speaker ?? defaultSpeakers[22]
        
        return presentation
    }(),
]
