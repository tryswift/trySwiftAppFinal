//
//  NYC2016Presentations.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let nyc2019Presentations: [String : Presentation] = [
    
    // Workshops - Day 0
    
    "swiftui" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["paulh"],
        title: "SwiftUI Hands-on",
        summary: "Come and get a crash course in SwiftUI development, learning how it works and how to get started building real apps in just two hours. We'll be covering all the most important UI components and view modifiers, diving into state management, trying out animations, and also going over the most important tips and tricks to help you get up to speed with SwiftUI as fast as possible – all while building a real project."
    ),
    "combinewrkshp" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["pauls"],
        title: "Super Easy Combine - This is an Awesome App Workshop",
        summary: "What is Combine? Do you need to know Reactive Swift? How can you use Combine in a real app?</p><p>If you don't know where to start with Apple's latest framework, join this workshop to upgrade your skills with Combine, SwiftUI, and asynchronous app design. In two hours, you'll create a data-driven app that connects to SwiftUI using Combine's reactive programming."
    ),
    "websocket" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["sanjian"],
        title: "Build a cloud-ready WebSocket server in Swift",
        summary: "In this workshop we'll create a real-time streaming app using the WebSocket protocol.  We'll build a Swift server on your Macbook using the Kitura framework and connect it up to an iOS app. Next it's time to build your server into a Docker microservice, deploy it into a cloud-ready Kubernetes cluster, and make it bullet-proof with monitoring, scaling and failover. Sounds complicated? We'll make it easy and fun. Learn some key skills, and get on the road to being a full-stack engineer."
    ),
    "bosear" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["bosear"],
        title: "Bose AR SDK for Native iOS Workshop",
        summary: "Excited about Bose AR and what you can build? We are too! Join our developer relations team for a hands-on workshop on building audio AR and sensor-driven experiences for new Bose devices. Through exercises, tools and code samples, you'll learn the simple steps to make amazing experiences for millions of users.  Bring your own laptop, we'll provide the code and devices for you to keep."
    ),
    "raspberrypi" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["marc"],
        title: "Swift on the Raspberry PI - Building A Circuit to Control an LED",
        summary: "In this workshop, we will build a simple circuit that allows us to control an LED. If time permits, we will also build a simple iOS app that also controls this LED. We will build our circuit using various electrical components that are driven by a Raspberry PI and Swift. This workshop will be very much hands-on! No electrical engineering or circuit design experience is necessary."
    ),
    "fractal" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["jon"],
        title: "Fractal: Atomic Design Theory with Declarative UI (think SwiftUI for Today)",
        summary: "Keep duplicating UI code? Need rapid prototyping for User Testing? Need a style-guide for unifying your UI? Need to rebrand quickly? If so, Fractal is for you! In this workshop we'll also cover how Fractal can help you prepare for Swift UI, by covering the basics of Atomic Design Theory, building reusable components to use today, and leverage Fractal to quickly build your own brand and build out new screens with a minimum of fuss."
    ),
    "prototyping" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["carson_mark"],
        title: "Technology Experience Prototyping",
        summary: "This workshop will be hands-on and participants will sketch out ideas, build physical and digital prototypes and test their experiences. During this session you’ll learn detailed best practices about each area of experience prototyping from planning, building, prototyping and learning. Skills you’ll learn: sketching sessions, rapid prototyping, role playing with people and technology, synthesis of the experience prototype."
    ),
    "communication" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["chris_workshop"],
        title: "Professional Communication Skill-Building",
        summary: "Communicating with others is a skill that everyone can get better at. The process of hearing and being heard are critical skills in your professional and personal life. This workshop gives you the opportunity to try out new tools for communicating effectively. Participants will work in pairs with guided exercises that help in unlocking new skills. Although these exercises are designed to be low-stress, there will also be relaxation area of the workshop where you can choose to opt-out of participating for whatever reason. Come join us for this fun and practical workshop!"
    ),
    
    // Presentations - Day 1
    
    "swiftui-production" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["lea"],
        title: "SwiftUI for Production",
        summary: "The iOS world has been a-buzz ever since SwiftUI came on the scene. Twitter threads exploded, countless books about the topic went into presale, and recruiters on LinkedIn seem to want us to have 3+ years of experience with the UI Toolkit. So, what’s all the fuss about, is it worth it, and how can you become part of the action?</p><p>In this talk, Lea Marolt Sonnenschein will go through some of the trials, triumphs and tribulations  she faced while developing the RayWenderlich iOS app for production, built entirely with SwiftUI. Then, she’ll compare and contrast SwiftUI against standard UIKit development. Finally, she’ll go over the most important lessons learned and offer some concrete advice and best practices to help you start building your own SwiftUI apps!"
    ),
    "natural-languages" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["dabby"],
        title: "Parsing natural languages in Swift",
        summary: "Unlike programming languages, Natural languages are often ambiguous to parse, and our brain often does some work behind the scenes to disambiguate from context. In this talk, we will explore how to create a MLModel for parsing natural languages in Swift."
    ),
    "mobile-releases" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["eli"],
        title: "Streamlining Mobile Releases",
        summary: "Anyone that has released mobile apps knows how time-consuming this is. Even tiny mistakes during the release process can be expensive: high impact to users, long recovery times, angry reviews, and lowered store ratings. If you want to learn how to make your releases reliable, multilingual, and highly automated, this talk is for you."
    ),
    "swift-literal" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["yuki"],
        title: "A Deeper Deep dive into Swift Literal",
        summary: "This session will deepen your understanding of Swift Literals. How are Literals handled over from code string? Why can Literals be the actual data? And why can we use data accurately from Literals? By following the Swift Literals in Swift Code to SIL and LLVM IR code, you will learn the answer. I'll also introduce Intrinsic Protocols, which are pre-defined protocols in Swift Compiler that has a deep connection with Swift Literals. Let's dive into the deeper side of Swift Literals!"
    ),
    "jane-austen" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["anne"],
        title: "Truths Universally Acknowledged: Swift Design Patterns as Jane Austen Heroes",
        summary: "Have you ever looked at your code and realized that a certain design pattern was charging in like a romantic hero, sweeping away the confusion and bringing order to chaos? Or perhaps you've encountered a pattern that you utterly hated...until its virtues slowly grew on you as you realized that the alternative was a complete disaster? Let's imagine Ada Lovelace reading Jane Austen, and compare some of my favorite design patterns with some of my favorite Jane Austen heroes."
    ),
    "combine" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["shai"],
        title: "Getting Started with Combine",
        summary: "In the last WWDC, Apple has finally released it's very own framework for declarative processing of values over time, making the skill of Reactive Programming a must for your toolset. But what does it actually mean, and why is it at all helpful for you as a developer? What are the tools and constructs Apple provide for us as developers?"
    ),
    "server-side" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["ian"],
        title: "Building the Server-side Swift ecosystem",
        summary: "One year ago, at try! Swift NYC 2018, the teams from Apple, Vapor and Kitura announced the Swift Server Working Group (SSWG) - an effort to mature the Swift ecosystem for developing and deploying server applications. Since then, six new libraries have been welcomed into the project, more are under development, and big improvements have happened in the Swift on Linux releases. In this talk I'll bring everyone up to date, and show how you can get involved. I'll finish by introducing Appsody, a new open source project for end-to-end development of cloud-native Swift applications - ready for your next SSWG-filled server-side Swift project!"
    ),
    "ios-image" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["jordan"],
        title: "The Life of an Image on iOS",
        summary: "There is a lot that's misunderstood with images on iOS, how they are sized, how much memory they consume and when they actually consume it. In this talk, we'll start by learning about the rendering pipeline, what buffers are and why we should care about them. Then we'll close with how to use them efficiently, and how to think about them holistically."
    ),
    "tensorflow" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["paige"],
        title: "Swift for TensorFlow: machine learning with no boundaries.",
        summary: "Swift for TensorFlow is an open-source, cross-platform machine learning framework built on top of TensorFlow. In this session, you will learn what features have recently been added to S4TF v0.4 and what the engineering team has planned for the upcoming months. We will also discuss why Swift is uniquely positioned to offer a production deployment solution for machine learning projects."
    ),
    "apis" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["davedelong"],
        title: "Designing Accessible APIs",
        summary: "Over the past 10 years of designing and shipping APIs to millions of developers, I’ve developed some fundamental rules I follow. These rules makes APIs accessible: they’re powerful but easy to use, even for novice developers. In this talk, we’ll explore these rules and how they can help you design APIs that stand the test of time and are a pleasure to use."
    ),
    "arkit-coreml" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["soojin"],
        title: "Deeper into ARKit with CoreML and Turi Create",
        summary: "Have you ever tried to make something cool and fun with ARKit, only to find out there is a missing piece? Then this talk is for you. I struggled to make my first AR app (Notable Me), but CoreML and Turi Create was there for me. This framework and tool allowed me to create something I never knew I could make.</p><p>I will share all the lessons I learned from developing this app, focusing on how to utilize machine learning into an ARKit app. Also how to unlock hidden features of Turi Create, Apple’s Open Source tool for easily creating custom ML models, to drastically improve the quality."
    ),
    "its-fine" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["cate"],
        title: "It’s Probably Fine",
        summary: "What's the difference between a functional team and a failing team? How do we make a failing team functional, and a functional team great? Let's talk about layers of communication, why outcomes are more important than process, and how to figure out where to begin - and whether you should."
    ),
    
    
    // Presentations - Day 2
    "ios13" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["dave"],
        title: "Making your app feel at home on iOS 13",
        summary: "iOS hasn't had a major redesign since iOS 7 in 2013, but that doesn't mean the incremental design changes each year aren't significant. Making your app fit well with the operating system is an important step towards usability so join Dave on a journey through the design changes this year, and learn how you can make your app feel at home in iOS 13."
    ),
    "encoding-decoding" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["kaitlin"],
        title: "Encoding and Decoding in Swift",
        summary: "Ever wonder what’s actually going on inside JSONEncoder and JSONDecoder? Why doesn't JSONEncoder conform to the Encoder protocol? What's a CodingKey, and what are all of those 'containers' for? This talk will be a deep dive into encoding and decoding in Swift: what all of the related protocols are, how they fit together, and how to use them. You will come away from this talk ready to customize how your Swift types are encoded and decoded, and with the knowledge necessary to start writing encoders and decoders of your own."
    ),
    "swiftui25" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["paulh"],
        title: "SwiftUI in 25 Minutes",
        summary: "SwiftUI is the cool new kid on the block, and while it's easy to make simple apps quickly what does it look like to build a larger app, from scratch, live on stage? In this session you're going to find out, because the entire thing will be a live-coded SwiftUI project with a custom user interface, beautiful, gesture-driven animations, and more. But wait... there's more! Why stop at just one platform? Let's see just how fast Paul can type…"
    ),
    "app-subscriptions" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["ish"],
        title: "App subscriptions - the good, the bad, and the ugly",
        summary: "Recently subscriptions have been somewhat of a hot topic. Apple has clearly expressed a new affinity for services and has introduced incentives for developers to use subscription pricing. Are subscriptions the right choice for your app, though? Let’s take a closer look and see."
    ),
    "cplusplus" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["laura"],
        title: "What Swift devs can learn from C++",
        summary: "Those of us who love Swift assume that it's the language everyone would use if only they could. C++ has a super active community of engineers, though, many of whom don't feel particularly hampered or tied down by their language choice at all. This will be a field-researched, playful tour of language elements that C++ devs would truly miss if they all switched over to Swift."
    ),
    "uicolor" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["kelly"],
        title: "Extending UIColor to Support Custom Styling",
        summary: "Supporting custom coloring can provide users with a sense of identity and community, but also introduces a handful of accessibility issues when it comes to color contrast and readability. Finding an engineering solution that satisfies designers while still allowing users to express themselves via customization can be tricky. Extending UIColor with a few simple methods can go a long way to prevent contrast issues like a very bright color on a white background. In this talk, we will explore color spaces and the components that make up a color. We will utilize these components and write code to measure color contrast as well as adjust a color's brightness to meet accessibility standards. We will also talk about how to adopt Dark Mode in iOS 13. You will walk away feeling confident about how to handle color collisions in your own apps."
    ),
    "AsyncHTTPClient" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["tom"],
        title: "Introduction to AsyncHTTPClient",
        summary: "Last year Apple released SwiftNIO - a framework for building high-performance event-driven networking applications. AsyncHTTPClient is a cross-platform HTTP client implementation built on top of SwiftNIO by the members of the Swift Server Working Group. As the Swift server community matured, projects like Vapor and Kitura implemented their own HTTP clients, indicating a need for a generic asynchronous, non-blocking HTTP client library. This is what AsyncHTTPClient aims to address.  This talk will cover the current functionality, walk through an entry-level tutorial, dive into more advanced usage, and discuss how the project will evolve in the future."
    ),
    "no-screens" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["marc"],
        title: "Swift Without Screens - Powering Connected Devices",
        summary: "Swift is an amazing language that can be used to power applications on our MacBooks, iPhones, watches, iPads, and televisions. But what about embedded systems or headless devices that don’t have screens? In this talk, Marc will discuss a few of the amazing ways Swift can be used to drive applications running on devices like the Raspberry PI. The purpose of this talk is to provide you with the steps needed to build your own projects on embedded systems using Swift."
    ),
    "bitcoin-cash" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["jean"],
        title: "Let’s play with Bitcoin Cash using Swift",
        summary: "Bitcoin Cash is known as a crypto currency but at first it’s a blockchain that allows you to make instant and cheap transactions between multiple parties around the world. I would love to share you what is Bitcoin Cash and how to play with on Swift. During our workshop, I expect you to build your first transaction on the Blockchain! What do you think of writing a permanent message on the Bitcoin Cash Blockchain? I hope you will enjoy this great technology and start building a bunch of apps!"
    ),
    "ayurveda" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["dr"],
        title: "Body Hacking Using Ayurveda",
        summary: "You are coding away when the clock tells you it is 3am, and your gut growls for dinner. Your hair is starting to fall out, and your poop is harder than your flash drives. What you need are some tools to grind you into a stronger, better place. Welcome to the wisdom of Ayurveda, which reminds you to be resilient and heroic with your body by conditioning its power through regular movement, strong with clear mind and super-perceptive senses, and daringly high in Integrity with your emotions. Using herbs and oils, and going for powerful foods and strong routines to fortify the body, the ultimate body hack is one in which your senses are intuitive and connected to super-Natural ways of living so you can stay standing and coding strong for decades."
    ),
    "lt1" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["twilio"],
        title: "Twilio",
        summary: "Twilio has democratized communications channels like voice, text, chat, video, and email by virtualizing the world’s communications infrastructure through APIs that are simple enough for any developer to use, yet robust enough to power the world’s most demanding applications."
    ),
    "lt2" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["bosear"],
        title: "Bose AR",
        summary: "Bose is enabling developers and creators to make a sound first approach to augmented reality. Through an innovative availability of sensor-driven, head movement and spatial sound capabilities, you can create new experiences that compliment the use of new Bose AR-enabled wearables finding their way to millions of users in 2019."
    ),
    "lt3" : Presentation(
        id: 1,
        speaker: nyc2019Speakers["agora"],
        title: "Agora.io",
        summary: "Agora delivers easy to embed Real-Time Engagement APIs which includes all the development tools and cloud infrastructure needed for mobile, web, and desktop applications."
    ),
]

