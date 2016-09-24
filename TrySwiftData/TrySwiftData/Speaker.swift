//
//  Speaker.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import RealmSwift
import UIKit

public class Speaker: Object {
    open dynamic var id: Int = 0
    open dynamic var name: String = "TBD"
    open dynamic var twitter: String = "TBD"
    open dynamic var imageName: String? = nil
    open dynamic var imagePath: String? = nil
    open dynamic var bio: String = "TBD"
    open dynamic var hidden: Bool = false
    
    
    public override static func primaryKey() -> String? {
        return "id"
    }
    
    public override static func indexedProperties() -> [String] {
        return ["id", "name", "hidden"]
    }
    
    public class var speakers: Results<Speaker> {
        let realm = try! Realm()
        return realm.objects(Speaker.self).filter("hidden == false").sorted(byProperty: "name")
    }
    
    public func getImage() -> UIImage {
        let defaultImage = UIImage(named: "tryLogo")!
        
        if let imageName = imageName {
            return UIImage(named: imageName) ?? defaultImage
        }
        if let imagePath = imagePath {
            return UIImage(contentsOfFile: imagePath) ?? defaultImage
        }
        
        return defaultImage
    }
}

public extension Speaker {
    
    class func insertDefaultSpeakers() {
        guard Speaker.speakers.isEmpty else { return }
        let realm = try! Realm()
        try! realm.write {
            defaultSpeakers.forEach {
                realm.add($0)
            }
        }
    }
}

public let defaultSpeakers: [Speaker] = [
    { let ellen = Speaker()
        ellen.id = 1
        ellen.name = "Ellen Shapiro"
        ellen.twitter = "designatednerd"
        ellen.imageName = "ellen_shapiro"
        ellen.bio = "Ellen Shapiro is the Lead Mobile Developer for SpotHero and former Director of iOS Engineering at an Vokal in Chicago, IL. She also builds Android apps and runs the Chicago AndroidListener meetup. She works in her spare time to bring leading songwriting application Hum to life, and writes iOS tutorials for RayWenderlich.com."
        return ellen
    }(),
    { let marc = Speaker()
        marc.id = 2
        marc.name = "Marc Brown"
        marc.twitter = "heymarcbrown"
        marc.imageName = "marc_brown"
        marc.bio = "Marc is the Mobile Engineering Manager at Blue Apron and has been building iOS apps since 2009. Previously he worked for Etsy and a handful of startups. Marc runs the Brooklyn Swift Meetup and loves encouraging others to learn Swift. In his spare time he enjoys retweeting Arrested Development quotes."
        return marc
    }(),
    { let rob = Speaker()
        rob.id = 3
        rob.name = "Rob Napier"
        rob.twitter = "cocoaphony"
        rob.imageName = "rob_napier"
        rob.bio = "Rob is co-author of iOS Programming Pushing the Limits. Before coming to Cocoa, he made his living sneaking into Chinese facilities in broad daylight. Later he became a Mac developer for Dell. It's not clear which was the stranger choice. He has a passion for the fiddly bits below the surface, like networking, performance, security, and text layout. He asks `but is it good Swift?` a lot."
        return rob
    }(),
    { let dani = Speaker()
        dani.id = 4
        dani.name = "Danielle Tomlinson"
        dani.twitter = "dantoml"
        dani.imageName = "daniel_tomlinson"
        dani.bio = "Danielle hails from England, but is currently embracing jet lag as a way of life. They co-organize NSLondon and ran Fruitconf. They have been building things for Apple platforms for 8 years, but now work at CircleCI and on open source libraries and tools such as CocoaPods."
        return dani
    }(),
    { let natalia = Speaker()
        natalia.id = 5
        natalia.name = "Natalia Berdys"
        natalia.twitter = "batalia"
        natalia.imageName = "natalia_berdys"
        natalia.bio = "Natalia Berdys is an independent iOS developer from Poland. Within 2 years, she managed to become a self-taught developer, get a Mobile Engineering degree, speak at Apple WWDC and take her apps to #1 in 47 countries. Since she also holds a Master's Degree in American Literature, she has a very humanistic and poetic view of programming. Previously with Tutu Lab, now evolving into her next form."
        return natalia
    }(),
    { let andyy = Speaker()
        andyy.id = 6
        andyy.name = "Andyy Hope"
        andyy.twitter = "AndyyHope"
        andyy.imageName = "andyy_hope"
        andyy.bio = "Since Andyy first started developing six years ago for iOS 3, he has become the lead iOS developer at Punters in Melbourne, Australia. He's constantly studying the language and finding creative new ways to challenge the norm. You can read about his discoveries at Medium.com/@AndyyHope."
        return andyy
    }(),
    { let kristina = Speaker()
        kristina.id = 7
        kristina.name = "Kristina Thai"
        kristina.twitter = "kristinathai"
        kristina.imageName = "kristina_thai"
        kristina.bio = "Kristina Thai is an iOS Software Engineer at Intuit, where she works on the QuickBooks Self-Employed iOS application. She is an expert in Apple Watch development and regularly writes tutorials and technical commentary on the subject on her website kristinathai.io. \n\nAs an international technical speaker, she has presented multiple times on Apple Watch development and has hosted workshops on how to build watch apps. Her past speaking events include talks at iOSDevUK, Swift Summit, Grace Hopper and many more. Kristina has a B.S. in Computer Science from the University of California, San Diego. Fun fact: she follows more animals on Instagram than people."
        return kristina
    }(),
    { let jorge = Speaker()
        jorge.id = 8
        jorge.name = "Jorge Ortiz"
        jorge.twitter = "jdortiz"
        jorge.imageName = "jorge_ortiz"
        jorge.bio = "Jorge is a freelance dedicated to mobile development, security, and systems architecture. As a developer he started to work for the M.I.T. in 1993 and since he has collaborated in many software projects. Most of them were internally for HP where he worked for more than 15 years. \n\nSince 2008 he has been working in different aspects of mobile development. After playing with PalmOS, he learned Android programming for the first Google App contest and immediately started to play with the first iPhone SDK. He often participates as instructor in the best iOS and Android Bootcamps in U.S.A. and Europe. He has recently founded Canonical Examples to help other developers to take a step forward and become senior developers in a very demanding market."
        return jorge
    }(),
    { let vixentael = Speaker()
        vixentael.id = 9
        vixentael.name = "Anastasiia Voitova"
        vixentael.twitter = "vixentael"
        vixentael.imageName = "anastasiia_voitova"
        vixentael.bio = "Anastasiia has been building iOS applications for several years, participating in the full product lifecycle: from gathering business demands and cost estimation, through ux prototyping to developing and long-term supporting. Often building both client and server sides and sharing her knowledge with the community from both sides of the barricades. \n\nAnastasiia got into computer security and cryptography when she was invited to fix a few lines of code in an iOS port of a cryptographic library and ended up taking over all of iOS development and some general mobile ideology part of the project. She physically lives in Kyiv, Ukraine, spends her time online twiting as @vixentael."
        return vixentael
    }(),
    { let anat = Speaker()
        anat.id = 10
        anat.name = "Anat Gilboa"
        anat.twitter = "anat_gilboa"
        anat.imageName = "anat_gilboa"
        anat.bio = "Anat is a software engineer at American Express, where she enjoys bringing the delight of Swift into the CoreMobile codebase daily. She is a Cocoa-turned-CocoaTouch developer with her initial start in localization automation tools. Prior to American Express, she studied Computer Science and Mathematics at the University of Virginia, where she found her love for applying ML to Genre Classification. In her free time, Anat likes to slackline and play ultimate frisbee."
        return anat
    }(),
    { let amy = Speaker()
        amy.id = 11
        amy.name = "Amy Dyer"
        amy.twitter = "Etsy"
        amy.imageName = "amy_dyer"
        amy.bio = "Amy is a staff software engineer at Etsy in Brooklyn, NY. She's been an iOS developer for 5 years and is currently working on Etsy's app for shoppers."
        return amy
    }(),
    { let sam = Speaker()
        sam.id = 12
        sam.name = "Samuel Giddins"
        sam.twitter = "segiddins"
        sam.imageName = "samuel_giddins"
        sam.bio = "Samuel is a developer well-versed in the rituals of writing developer tools that sometimes work. When he's not breaking Bundler and CocoaPods, you can find him at the library at UChicago, studying something impractical. In a former life, he has worked on everything from social networking apps to databases to constrained optimization problems. When not coding, Samuel is often found in the library doing homework, wishing he were writing code."
        return sam
    }(),
    { let hector = Speaker()
        hector.id = 13
        hector.name = "Hector Matos"
        hector.twitter = "allonsykraken"
        hector.imageName = "hector_matos"
        hector.bio = "Raised by llamas in the great state of Texas, Hector grew to be an avid couch potato who likes spending his precious couch time playing the Legend of Zelda or yelling at the TV whilst watching Game of Thrones. While he isn't sitting at home vegging out, blogging or working on KrakenDev.io, you can find him sitting at the office writing iOS & Android mobile apps for Capital One. With a particular penchant for great mobile UI/UX, Hector writes the code that makes the world go round."
        return hector
    }(),
    { let tj = Speaker()
        tj.id = 14
        tj.name = "T.J. Usiyan"
        tj.twitter = "griotspeak"
        tj.imageName = "tj_usiyan"
        tj.bio = "A writer, musician, and developer interested in crafting interesting and artful work. Developer of the universal app Chordal Text and AU Additive Synthesizer. TJ is a graduate of Eugene Lang College and Berklee College of Music."
        return tj
    }(),
    { let daniel = Speaker()
        daniel.id = 15
        daniel.name = "Daniel Jalkut"
        daniel.twitter = "danielpunkass"
        daniel.imageName = "daniel_jalkut"
        daniel.bio = "Daniel Jalkut is the founder of Red Sweater, where he develops MarsEdit, the popular blog editing software for the Mac. He has been an active participant in the Mac and iOS communities, sharing bits of wisdom on his company blog, the Bitsplitting blog, and on Twitter. He is also one of the familiar voices from the popular indie-developer podcast Core Intuition."
        return daniel
    }(),
    { let bojana = Speaker()
        bojana.id = 16
        bojana.name = "Bojana Jam"
        bojana.twitter = "bojanajam"
        bojana.imageName = "bojana_jam"
        bojana.bio = "Coming from a background in Architectural design, Bojana is a Senior UX Designer at Typeform in Barcelona. She honed her design skills in San Francisco while focusing on the underlying drivers of human behavior. In her perfect world, technology would be designed around human biology and a small jar of Nutella would be delivered to her desk, daily. In her free time she enjoys tango, brunch and occasionally writes about herself in third person."
        return bojana
    }(),
    { let saul = Speaker()
        saul.id = 17
        saul.name = "Saul Mora"
        saul.twitter = "casademora"
        saul.imageName = "saul_mora"
        saul.bio = "Trained in the mystical and ancient arts of manual memory management, compiler macros and separate header files. Saul Mora is a developer who honors his programming ancestors by using Optional variables in swift on all UIs created from Nib files. Despite being an Objective C neckbeard, Saul has embraced the Swift programming language. Currently, Saul resides in Shanghai China working at 流利说 (Liulishuo) helping Chinese learn English while he is learning 普通话 (mandarin)."
        return saul
    }(),
    { let marin = Speaker()
        marin.id = 18
        marin.name = "Marin Todorov"
        marin.twitter = "icanzilb"
        marin.imageName = "marin_todorov"
        marin.bio = "Marin Todorov is an iOS developer and author. He's part of Realm and the Ray Wenderlich team. He's the author of the `iOS Animations by Tutorials` book and runs the `iOS Animations by Emails` newsletter. Besides crafting code, Marin also enjoys blogging, writing books, teaching, and speaking. He sometimes open sources his code. He walked the way to Santiago."
        return marin
    }(),
    { let natasha = Speaker()
        natasha.id = 19
        natasha.name = "Natasha Nazari"
        natasha.twitter = "natasha_nazari"
        natasha.imageName = "natasha_nazari"
        natasha.bio = "Natasha is new to the world of software development. For the past three years, she has been teaching and learning languages around the world. When she couldn't find a suitable app to learn Russian in early 2015, she decided to try out iOS development. She's been in love with coding ever since. At the moment, she's building two language apps in Swift, growing her meet-up Language Tech Taipei, diving into full-stack web development at Free Code Camp, and pushing for full fluency in Spanish and Russian."
        return natasha
    }(),
    { let erik = Speaker()
        erik.id = 20
        erik.name = "Erik Romijn"
        erik.twitter = "erikpub"
        erik.imageName = "erik_romijn"
        erik.bio = "Erik is the co-founder and CTO of a small company that helps governments manage healthcare. He is deeply involved in the community around Django, a popular Python web framework, being a Django core developer, chair of the Dutch Django Association and co-organiser of various conferences. A long time ago, stopping just around the time Swift was first introduced, Erik did iOS development as well. He won various local awards by building the most popular independent Dutch public transit app at the time. \n\nErik cares about building communities and conferences in which everyone feels welcome, valued and at home, regardless of their background. He has specific interest in well-being and ethical issues around communities and development."
        return erik
    }(),
    { let ryan = Speaker()
        ryan.id = 21
        ryan.name = "Ryan Nystrom"
        ryan.twitter = "_ryannystrom"
        ryan.imageName = "ryan_nystrom"
        ryan.bio = "Ryan is a lead iOS engineer at Instagram working on app infrastructure in New York City. He is an avid open source advocate and contributor at Facebook on projects like AsyncDisplayKit. Ryan is also an author and presenter with RayWenderlich.com publishing work on the Apple Watch, 3D Touch, and Reactive Cocoa."
        return ryan
    }(),
    { let chrisBailey = Speaker()
        chrisBailey.id = 22
        chrisBailey.name = "Chris Bailey"
        chrisBailey.twitter = "Chris__Bailey"
        chrisBailey.imageName = "chris_bailey"
        chrisBailey.bio = "Chris Bailey is a developer and technical leader in the Runtime Technologies team at IBM. Chris has spent over 15 years working on runtimes, working with the open source communities for Java, Node.js and most recently, Swift. He has contributed to the Swift Language, Foundation and Dispatch projects, and is currently working on making more server-focused APIs available to the community."
        return chrisBailey
    }(),
    { let katsumi = Speaker()
        katsumi.id = 23
        katsumi.name = "Katsumi Kishikawa"
        katsumi.twitter = "k_katsumi"
        katsumi.imageName = "katsumi_kishikawa"
        katsumi.bio = "Katsumi Kishikawa is an iOS/OS X developer working at Realm. He is a serial open source library developer, and has published some popular libraries on GitHub. He has largely contributed to the iOS developer community in Japan with his experience and knowledge."
        return katsumi
    }(),
    { let cate = Speaker()
        cate.id = 24
        cate.name = "Cate Huston"
        cate.twitter = "catehstn"
        cate.imageName = "cate_huston"
        cate.bio = "Cate Huston has lived and worked in the UK, Australia, Canada, China and the United States, previously as Director of Mobile Engineering at Ride, an engineer at Google, an Extreme Blue intern at IBM, and a ski instructor. Cate speaks internationally on mobile development and her writing has been published on sites as varied as Lifehacker, The Daily Beast, The Eloquent Woman and Model View Culture. She is an advisor at Glowforge, co-curates Technically Speaking, blogs at Accidentally in Code and is @catehstn on Twitter."
        return cate
    }(),
    {
        let chrisBritt = Speaker()
        chrisBritt.id = 25
        chrisBritt.name = "Chris Britt"
        chrisBritt.twitter = "chrisbritt"
        chrisBritt.imageName = "chris_britt"
        chrisBritt.bio = "Chris Britt mixes interactive stunts, comedy, tricks of perception together in his own way.  You'll see him between the conference's speakers doing his thing.  From Boston originally, he now lives in San Francisco."
        return chrisBritt
    }(),
    {
        let robert = Speaker()
        robert.id = 26
        robert.name = "Robert Dickerson"
        robert.twitter = "rfdickerson"
        robert.imageName = "robert"
        robert.bio = "Robert F. Dickerson is a lead software engineer in Swift@IBM at Austin, TX. He is focused on enriching the `Swift on the server` community by being a developer for the web framework `Kitura`, Swift server libraries and SDKs, and also sample applications. He has taught computer science courses at the University of Texas (Austin) and the College of William and Mary and has written numerous research papers about mobile computing, Internet of Things, and virtual reality. When not busy writing code, he is busy swing dancing at nights."
        return robert
    }(),
    {
        // special double speaker case
        let chrisRobert = Speaker()
        chrisRobert.id = 27
        chrisRobert.name = "Chris Bailey & Robert Dickerson"
        chrisRobert.twitter = "IBM"
        chrisRobert.imageName = "chris_robert"
        chrisRobert.hidden = true
        chrisRobert.bio = "Chris Bailey is a developer and technical leader in the Runtime Technologies team at IBM. Chris has spent over 15 years working on runtimes, working with the open source communities for Java, Node.js and most recently, Swift. He has contributed to the Swift Language, Foundation and Dispatch projects, and is currently working on making more server-focused APIs available to the community. \n\nRobert F. Dickerson is a lead software engineer in Swift@IBM at Austin, TX. He is focused on enriching the `Swift on the server` community by being a developer for the web framework `Kitura`, Swift server libraries and SDKs, and also sample applications. He has taught computer science courses at the University of Texas (Austin) and the College of William and Mary and has written numerous research papers about mobile computing, Internet of Things, and virtual reality. When not busy writing code, he is busy swing dancing at nights."
        return chrisRobert
    }()
]


