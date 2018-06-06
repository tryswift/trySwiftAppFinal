//
//  NYC2016Speakers.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let sjo2018Speakers: [String : Speaker] = [
    "dave" : { let speaker = Speaker()
        speaker.id = 1
        speaker.name = "Dave DeLong"
        speaker.twitter = "davedelong"
        speaker.imageAssetName = "dave.jpg"
        speaker.bio = "A seven-year veteran of Apple, Dave DeLong is an accomplished iOS engineer with a passion for teaching, and hacking the Objective-C runtime. During his time at Apple, he worked on the UIKit framework, Developer Evangelism, and Apple Maps. He currently works on the Product Experience team at Snap, Inc.</p><p>Dave, his family, and his large collection of bowties live near Salt Lake City, where he’s an active member of the local developer community. He can often be found on Twitter teaching developers about all the ways that calendrical calculations can go wrong and pontificating on the virtues of eating chocolate with peanut butter."
        return speaker
    }(),
    "kita" : { let speaker = Speaker()
        speaker.id = 2
        speaker.name = "Yusuke Kita"
        speaker.twitter = "kitasuke"
        speaker.imageAssetName = "kita.jpg"
        speaker.bio = "Yusuke Kita is an iOS developer at Mercari. He works on the internationalization of the Mercari app. He is passionate about learning new technology. When not coding, you can find him cycling."
        return speaker
    }(),
    "nafu" : { let speaker = Speaker()
        speaker.id = 3
        speaker.name = "Fumiya Nakamura"
        speaker.twitter = "nafu003"
        speaker.imageAssetName = "fumiya.png"
        speaker.bio = "Fumiya is CTO at ookami, a Japanese sports tech startup. He is currently working on an app called Player!, that is a service bringing new ways to enjoy sports in real time. He's been writing Swift since 2014, soon after Apple launched it. Player! has been fully written in Swift from start. He loves the open source community, is one of the core contributors to fastlane, and helps mobile developers focus their products."
        return speaker
    }(),
    "kostia" : { let speaker = Speaker()
        speaker.id = 4
        speaker.name = "Kostiantyn Koval"
        speaker.twitter = "KostiaKoval"
        speaker.imageAssetName = "kostia.jpg"
        speaker.bio = "Kostiantyn started working as an iOS developer back in the days on iPhone 3G. He immediately knew that Swift is a revolution and jumped on it from day one! He has contributed to Swift Package Manager and is also the author of the Swift High Performance book. He is now pursuing his new passion - compilers."
        return speaker
    }(),
    "ganzy" : { let speaker = Speaker()
        speaker.id = 5
        speaker.name = "Takeru Chuganji"
        speaker.twitter = "chuganzy"
        speaker.imageAssetName = "takeru.jpg"
        speaker.bio = "Takeru a.k.a. Ganzy is the iOS Tech Lead at Mercari in the U.S. He loves to contribute to open source projects to make engineers happy and has contributed to Carthage, fastlane, Swift, and so on. Also he loves dogs so you can find him with a super cute Bulldog Puppy's profile picture on Twitter, GitHub, and some Slack channels."
        return speaker
    }(),
    "harlan" : { let speaker = Speaker()
        speaker.id = 6
        speaker.name = "Harlan Haskins"
        speaker.twitter = "harlanhaskins"
        speaker.imageAssetName = "harlan.jpg"
        speaker.bio = "Harlan is a student at Rochester Institute of Technology. He founded LLVMSwift, an organization that aims to provide Swift engineers with compiler-oriented tools. He has spent the past two summers at Apple working on Swift, and plans to return full time on the Swift compiler team."
        return speaker
    }(),
    "mzp" : { let speaker = Speaker()
        speaker.id = 7
        speaker.name = "Hiroki Mizuno"
        speaker.twitter = "mzp"
        speaker.imageAssetName = "hiroki.jpg"
        speaker.bio = "Hiroki(a.k.a. mzp) is an iOS application developer working for fintech startup, Misoca. He is also an input method developer. He develops open source Japanese input method for macOS/iOS. He loves sushi and holds 🍣.gq domain. You can find many sushi images on it."
        return speaker
    }(),
    "naruchigi" : { let speaker = Speaker()
        speaker.id = 8
        speaker.name = "Naruki Chigira"
        speaker.twitter = "naruchigi"
        speaker.imageAssetName = "naruki.jpg"
        speaker.bio = "Naruki is iOS application engineer and scrum master at Timers-inc. He has been involved in the development of applications Pairy and Famm since the early stages. He also develop application Liv arXiv personally. He was a LT speaker at try! Swift 2018 Tokyo."
        return speaker
    }(),
    "bas" : { let speaker = Speaker()
        speaker.id = 9
        speaker.name = "Bas Broek"
        speaker.twitter = "BasThomas"
        speaker.imageAssetName = "bas.jpg"
        speaker.bio = "Bas is an iOS and tooling developer at XING. He is currently curating Swift Weekly Brief and contributing to frameworks, apps and tooling in open source. He likes Swift and experimenting with other programming languages."
        return speaker
    }(),
    "garric" : { let speaker = Speaker()
        speaker.id = 10
        speaker.name = "Garric G. Nahapetian"
        speaker.twitter = "garricn"
        speaker.imageAssetName = "garric.jpg"
        speaker.bio = "Garric is an iOS Engineer at Tinder as well as the host of The SwiftCoders Podcast and the founder of the Learn Swift {CITY} group of meet ups."
        return speaker
    }(),
    "david" : { let speaker = Speaker()
        speaker.id = 11
        speaker.name = "David Hart"
        speaker.twitter = "dhartbit"
        speaker.imageAssetName = "david.jpg"
        speaker.bio = "David is the Lead iOS Developer at Atipik, a small mobile development shop in Geneva. He's shown his passion for Swift Open Source as a contributor to the Swift Package Manager and by pitching in on Swift Evolution."
        return speaker
    }(),
    "pushkar" : { let speaker = Speaker()
        speaker.id = 12
        speaker.name = "Pushkar Kulkarni"
        speaker.twitter = "pushkar_nk"
        speaker.imageAssetName = "pushkar.jpg"
        speaker.bio = "Pushkar Kulkarni is a server-side Swift developer working with IBM. Prior to Swift, he worked on IBM's Java runtime, working on the JIT compiler and the Java standard library. Over the last two years, he has been contributing to open source Swift Foundation, focussed on making URLSession fully functional on Linux. He thinks Swift is the coolest language ever and is excited about the opportunities it offers on the server side."
        return speaker
    }(),
]
