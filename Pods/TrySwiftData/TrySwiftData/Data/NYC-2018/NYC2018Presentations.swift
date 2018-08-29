//
//  NYC2016Presentations.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let nyc2018Presentations: [String : Presentation] = [
    
    // Workshops
    
    "func_workshop" : Presentation(
        id: 1,
        speaker: nyc2018Speakers["stephencelis"],
        title: "Understanding Function Composition with Setters",
        summary: "In this workshop we'll take a different approach to explore the foundations of functional programming: by focusing on functions and how they compose. We'll get comfortable with composition by defining and working with various operators, build an intuition for how function signatures connect, and bring things down to earth with some real-world applications for simplifying and improving your everyday code."
    ),
    
    "crypto_workshop" : Presentation(
        id: 2,
        speaker: nyc2018Speakers["crypto_team"],
        title: "Adding Cryptocurrency Support to your iOS App",
        summary: "This workshop will be a chance for iOS engineers interested in the intersection of Ethereum and mobile to learn about supporting Ethereum transactions on iOS. We’ll leave time for people to discuss what they’re working on, so both beginners and people already working on Ethereum-iOS projects are welcome!"
    ),
    
    "kotlin_workshop" : Presentation(
        id: 3,
        speaker: nyc2018Speakers["jonbott"],
        title: "Kotlin: Through the looking glass",
        summary: "Have you ever needed to consume a cross-platform library such as Charts for iOS and keep parity with your Android teammates?  Or perhaps you've been curious about porting your app to Android, but don't want to deal with Java.  Well, the good news is you can do this easily because you already know Kotlin - you just need some hands-on experience and to learn about the few small differences. Come take a look at how easy it is to learn Kotlin, build an android app, and find out what the hype is all about!  It ain't all roses, but it is a beautiful thing!"
    ),
    
    "accessiblity_workshop" : Presentation(
        id: 4,
        speaker: nyc2018Speakers["bas"],
        title: "Making your app more accessible",
        summary: "Go hands on with the accessibility APIs to make your app a better experience for everyone. By first exploring the different ways we can use our devices with the accessibility tools, you can get an idea of what it is like to use these tools, and where an app needs work to improve it. Work either on your own app or one of the great open source apps to improve your app for all users."
    ),
    
    "ar_workshop" : Presentation(
        id: 5,
        speaker: nyc2018Speakers["berta"],
        title: "Augmented Reality using ARKit",
        summary: "In this workshop, we will be building a tag championship game using the world map from ARKit 2, a small cooperative game using AR object in space where every participant shares the same world and reality. During the workshop attendees will not only learn how to share world AR experiences through ARKit 2 but also how to render 3D models, have objects react to proximity of users and use a 3D scene to build an AR experience."
    ),
    
    "kitura_workshop" : Presentation(
        id: 6,
        speaker: nyc2018Speakers["kitura_team"],
        title: "Build a Cloud-Native Swift App",
        summary: "In this workshop you'll learn the fundamentals of cloud-native technologies like Docker and Kubernetes, and build and deploy a real server-side Swift microservice into a production cloud cluster.  By first building a RESTful API in Kitura, we'll add in database persistence, monitoring, scaling and failover.  Sounds complicated?  We provide the tools and APIs to make it easy.  Learn some key skills, and get on the road to being a full-stack engineer."
    ),
    
    "vapor_workshop" : Presentation(
        id: 7,
        speaker: nyc2018Speakers["vapor_team"],
        title: "Deploying Your First Vapor API",
        summary: "This workshop is designed to help guide you through the deploy of your first Vapor API. We'll cover the basics of getting started with a new project, show some of the finer points of an API with Vapor, and ultimately, we'll cover how to deploy your project to the cloud. Let's be honest, building websites is cool, but until you have it live in the cloud, it always feels like something's missing. Come spend the day with Tanner Nelson and Logan Wright to learn more."
    ),
    
    // Presentations - Day 1

    "fear" : Presentation(
        id: 8,
        speaker: nyc2018Speakers["ash"],
        title: "Circumventing Fear of the Unknown",
        summary: "Have you ever seen Batman Begins? There's this great line where a bad guy says 'you always fear what you don't understand', and while I think there may be some truth to that, humans are pretty smart and I think we can probably figure out how to overcome our fears. When building software, we come across things we don't understand all the time. Overcoming our fear of what's beyond our understanding is incredibly useful to be happy and productive programmers. In this talk, Ash Furrow will go over some examples of things that scared him, and some of the techniques he uses to overcome that fear."
    ),
    
    
    "granted" : Presentation(
        id: 9,
        speaker: nyc2018Speakers["bas"],
        title: "Taken For Granted",
        summary: "A look back at Swift when it was still in development (and how it rapidly changed), when in was in its beta stages, through to Swift 1 and 2 — and what is to come. I want to explore interesting parts of the evolution of the Swift language, and what that can bring now that we have a stable Swift 4, with Swift 5 around the corner - while also taking a look at the various long-term goals, like concurrency, regex, and an ownership model. How open source Swift has changed the language (particularly focusing on the involvement of the Swift evolution process) and the community that has formed around it."
    ),
    
    "machinelearning" : Presentation(
        id: 10,
        speaker: nyc2018Speakers["aileen"],
        title: "Understanding the Machine Learning Behind Common iOS Use Cases",
        summary: "A look back at Swift when it was still in development (and how it rapidly changed), when in was in its beta stages, through to Swift 1 and 2 — and what is to come. I want to explore interesting parts of the evolution of the Swift language, and what that can bring now that we have a stable Swift 4, with Swift 5 around the corner - while also taking a look at the various long-term goals, like concurrency, regex, and an ownership model. How open source Swift has changed the language (particularly focusing on the involvement of the Swift evolution process) and the community that has formed around it."
    ),
    
    "memojis" : Presentation(
        id: 11,
        speaker: nyc2018Speakers["berta"],
        title: "Memojis under the hood",
        summary: "During this year's keynote memoji was introduced to iOS 12 and iPhone X, allowing users to create a meme of their own persona and use that for message apps as an animoji. In this talk I will walk you through some of the new thing from Face Tracking and how you can create your own memoji using ARKit 2."
    ),
    
    "startup" : Presentation(
        id: 12,
        speaker: nyc2018Speakers["leah"],
        title: "Idea to launch - the start of a startup",
        summary: "Everyone is starting a startup these days. As a three-time startup founder, I'll get into how to come up with a great app idea, build a prototype and test it with users, pick a company name and incorporate, and how to launch your app to the world."
    ),
    
    "server" : Presentation(
        id: 13,
        speaker: nyc2018Speakers["gopal"],
        title: "Swift on Server: Are We There Yet?",
        summary: "Swift on the server has been talked about since Swift was open sourced. There have been a lot of efforts to make Swift on the server viable. However, when building a product, you should be focused on your product, not on the tools and frameworks backing it. This talk evaluates the holistic experience of building a small (but real) backend in Swift, versus a few well known frameworks in other languages, and tries to answer the age old question: Are we there yet?"
    ),
    
    "swiftnioNetwork" : Presentation(
        id: 14,
        speaker: nyc2018Speakers["jw"],
        title: "SwiftNIO and Network.framework",
        summary: "SwiftNIO was developed with a focus on providing useful, high-performance tools for building event-driven networking applications on the server side. It turns out that these primitives also work well in client applications. While the primitives transfer over, the networking environment is very different, and the socket layer, which works well in a server environment, is substantially less suited to operating on mobile clients. For this reason, SwiftNIO provides integration with the brand new Network.framework on Apple's client devices: a modern network stack for a mobile age. This talk will discuss the powerful tools that Network.framework provides, and how SwiftNIO exposes them. It'll discuss the different design tradeoffs between server and client side, and cover some of the key differences in the networking environments. Finally, this talk will look to the future, and discuss how the server and client worlds could converge over time."
    ),
    
    "generic" : Presentation(
        id: 15,
        speaker: nyc2018Speakers["jt"],
        title: "Making it Generic",
        summary: "Generic programming is a powerful paradigm that improves productivity and safety by allowing components to be reused without modification. In this talk, you will learn to make generic programs by identifying common requirements in a collection of similar concrete types."
    ),
    
    "siri" : Presentation(
        id: 17,
        speaker: nyc2018Speakers["christina"],
        title: "Let Them Say What They Want: Adding Siri Shortcuts",
        summary: "Siri Shortcuts help to improve your user experience by making actions available with Siri in iOS, watchOS, CarPlay and HomePod. We can set up our apps to give easy access to frequent actions without needing to open the app. Even better, iOS can suggest frequently used actions pro-actively using notifications or the lock screen.</p><p>We’ll see how to add custom Siri Shortcuts to our apps, how to  expose them so that Siri can recommend them, and how to let users set up their own voice commands to access their favourite Shortcuts."
    ),
    
    "mlstart" : Presentation(
        id: 18,
        speaker: nyc2018Speakers["audrey"],
        title: "Getting Started with Apple ML",
        summary: "You want to add ML to your apps but you think you need to study a lot of math and write Python and you can’t find the time? Think again: Apple’s Create ML gets you started in the comfort of Xcode and Swift! No math needed :]. Create ML is brilliant for getting you started with ML. It makes it easy to try different datasets — getting your data right is actually the hardest and most time consuming part of ML. Once you get started with ML, you won’t want to wait / hope for Apple to add more models to Create ML. To help you explore the ML universe that’s written in Python, I’ll reduce the fright factor by comparing Create ML Swift with Turi Create Python, and showing you how to quick-start your exploration of Turi Create. And I’ll point you to Keras and scikit-learn, in case you want to roll your own models."
    ),
    
    "socialmedia" : Presentation(
        id: 19,
        speaker: nyc2018Speakers["jen"],
        title: "What I learned creating a social media app clone",
        summary: "Ever look at an app and think, 'I wonder how I'd build that?' After scrolling through Instagram looking at cat photos, I decided to try my hand at building some of its features to determine how I'd tackle common development challenges. In this talk I share what I learned, including tips for designing a scalable data structure in a NoSQL database and implementing smooth scrolling with dynamically downloaded images."
    ),
    
    "tactileux" : Presentation(
        id: 20,
        speaker: nyc2018Speakers["sdw"],
        title: "Crafting a delightful tactile user interface",
        summary: "Go through the steps to take a simple user interface from a utility to a sheer delight. Learn the touches and mindset required to (re)design your app's UI to let users love interacting with it."
    ),
    
    // Presentations - Day 2

    "sdks" : Presentation(
        id: 22,
        speaker: nyc2018Speakers["felix"],
        title: "Trusting SDKs",
        summary: "Using third party SDKs significantly speeds up your development process. Felix will talk about the risks of depending on external code, and how an attacker can easily inject malicious code in software you bundle within your app."
    ),
    
    "swiftnio" : Presentation(
        id: 23,
        speaker: nyc2018Speakers["logan"],
        title: "Swift NIO, Vapor, and Server Concurrency",
        summary: "NiO, Vapor's integration, and what it means for future of Swift."
    ),
    
    "coredata" : Presentation(
        id: 24,
        speaker: nyc2018Speakers["tom"],
        title: "Effective Core Data with Swift",
        summary: "Core Data brings a lot of power to an app and continues to evolve, but it can have rough spots when you're working in Swift. What if you want to save an enum pr a struct? Does it help if your data is Codable? What's the best way to create Swift-friendly model classes? This session will cover techniques and gotchas for integrating Core Data with your Swift code."
    ),
    
    "swift-services" : Presentation(
        id: 25,
        speaker: nyc2018Speakers["kitura_team"],
        title: "Swift Services are Simple",
        summary: "Chris and Ian will explore what it’s like to build REST APIs in Kitura 2, using the built-in support for OpenAPI. Quickly generate an iOS and Android client SDK to use in your app, and deploy your server-side Swift app to the cloud. We’ll also provide an update on Kitura development and what the future might hold."
    ),
    
    "codereview" : Presentation(
        id: 26,
        speaker: nyc2018Speakers["april"],
        title: "Compassionate—Yet Candid—Code Reviews",
        summary: "Code reviews are essential for maintaining code quality and helping developers sharpen their coding skills. However, code reviews are also difficult to get right. Many code review comments end up being unclear, trivial, or condescending.</p><p>With compassion as a guideline, though, we can work to establish code review practices that minimize suffering for everyone involved—the code authors, the code reviewers, the code maintainers, and even the end users.</p><p>In this talk, you’ll learn that Compassionate Code Reviews are not about “sugarcoating” feedback and actually demand a considerable degree of candor. Equipped with a set of guidelines for executing Compassionate Code Reviews, you’ll leave inspired to apply them on your team to create better code and happier coders."
    ),
    
    "marzipan" : Presentation(
        id: 27,
        speaker: nyc2018Speakers["peter"],
        title: "Hacking Marzipan",
        summary: "I will show the hacks currently needed to try Marzipan, and walk through what I needed to do to get PDF Viewer to run on macOS Mojave."
    ),
    
    "coreml" : Presentation(
        id: 28,
        speaker: nyc2018Speakers["kenmaz"],
        title: "Super Resolution with CoreML",
        summary: "The ‘Super Resolution' technique is used for converting low resolution images into high resolution, which reduces the amount of image data that needs to be transferred. In this talk, I'd like to show you the implementation of super resolution with CoreML and Swift, and compare the results with conventional methods. I’ll also talk about how to train your own model using your own data step by step. In addition, I’d like to introduce recent topics such as Turi Create, Swift for TensorFlow, CoreML2 and CreateML, which will be enhanced in iOS 12 and I’ll look at how iOS will take advantage of machine learning technology in the future.."
    ),
    
    "notifications" : Presentation(
        id: 29,
        speaker: nyc2018Speakers["kaya"],
        title: "Customizing Your Notifications for iOS 12",
        summary: "At WWDC, Apple announced a lot of changes coming to Notifications for iOS 12. In this talk, we’ll go over these new features (provisional authorization, updating notification settings from the lock screen, group notifications and user interaction within a notification) and discuss ideas on how and why you might want to take advantage of them for your app."
    ),
    
    "speed" : Presentation(
        id: 30,
        speaker: nyc2018Speakers["erica"],
        title: "Need for Speed: How XO Group Optimized their Image Loading Time on The Knot Mobile App",
        summary: "In an increasingly fast-paced society, users demand immediate satisfaction from their products. When they tap on a mobile app icon they expect it to launch in four seconds or less. With 23% of users abandoning an app after first use, there’s not a second to spare in making a great first impression. See how much of The Knot’s loading time was eaten up by our asset catalogs and what we did about it."
    ),
    
    "strings" : Presentation(
        id: 31,
        speaker: nyc2018Speakers["mattt"],
        title: "Strings Seven Ways",
        summary: "Strings are the most versatile type in the Swift standard library. This talk looks at seven different ways to understand and work with strings: as collections of Unicode characters, as identifiers, as paths, as natural language text, as encoded data, as structured data, and as typographic content."
    ),
    
    "betterswift" : Presentation(
        id: 32,
        speaker: nyc2018Speakers["ddate"],
        title: "Make our Swift better",
        summary: "It has been three years since Swift was first introduced. Yet there are still missing features and unfixed bugs. The good news is that Swift is open source and we, the community have the power to fix it. In this talk, I’ll discuss how to pitch an idea in Swift Forums, submit a Proposal, and how to build, test and benchmark Swift using the example of Dictionary.compactMapValues that I proposed and got merged for Swift 5."
    ),
    
    "superpowers" : Presentation(
        id: 33,
        speaker: nyc2018Speakers["alicia"],
        title: "Using your superpowers for good to change the world!",
        summary: "A 16-year-old inspired me to learn to code. This lit the fuse that would take me on an amazing journey through challenges and victories while creating an app to help victims escape domestic violence and abuse."
    ),
    
]
