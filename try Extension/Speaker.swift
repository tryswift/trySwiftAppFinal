//
//  Speaker.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/21/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

struct Speaker {
    let name: String
    let twitter: String
    let image: String
    let presentation: Presentation
}

extension Speaker {
    
    static let ashFurrow = Speaker(
        name: "Ash Furrow",
        twitter: "ashfurrow",
        image: "ashfurrow",
        presentation: Presentation(
            title: isJapanese ? "Artsyにおけるテスト手法の紹介" : "An Artsy Testing Tour"
        )
    )
    
    static let caesarWirth = Speaker(
        name: "Caesar Wirth",
        twitter: "cjwirth",
        image: "caesar",
        presentation: Presentation(
            title: isJapanese ? "Swiftでサーバを書いてみよう" : "Soaring Swiftly - Server Side Swift."
        )
    )
    
    static let jesseSquires = Speaker(
        name: "Jesse Squires",
        twitter: "jesse_squires",
        image: "squires",
        presentation: Presentation(
            title: isJapanese ? "オープンソースSwiftへの貢献" : "Contributing to open source Swift"
        )
    )
    
    static let syoIkeda = Speaker(
        name: "Syo Ikeda",
        twitter: "ikesyo",
        image: "syo",
        presentation: Presentation(
            title: isJapanese ? "Swiftのエコシステムに飛び込む" : "Dive into Swift Ecosystem"
        )
    )
    
    static let veronicaRay = Speaker(
        name: "Veronica Ray",
        twitter: "nerdonica",
        image: "veronica",
        presentation: Presentation(
            title: isJapanese ? "Swiftにおける実践的なモック化について" : "Real World Mocking In Swift"
        )
    )
    
    static let chrisEidhof = Speaker(
        name: "Chris Eidhof",
        twitter: "chriseidhof",
        image: "chris",
        presentation: Presentation(
            title: isJapanese ? "SwiftらしいTable View Controllerの使い方" : "Table View Controllers in Swift"
        )
    )
    
    static let timOliver = Speaker(
        name: "Tim Oliver",
        twitter: "TimOliverAU",
        image: "timoliver",
        presentation: Presentation(
            title: isJapanese ? "Core Animationで作る高度なグラフィックス" : "Advanced Graphics with Core Animation"
        )
    )
    
    static let hirokiKato = Speaker(
        name: "Hiroki Kato",
        twitter: "cockscomb",
        image: "hiroki",
        presentation: Presentation(
            title: isJapanese ? "Motivation based library abstraction" : "Motivation based library abstraction"
        )
    )
    
    static let dianaZmuda = Speaker(
        name: "Diana Zmuda",
        twitter: "dazmuda",
        image: "diana",
        presentation: Presentation(
            title: isJapanese ? "Swiftトレーニング: 統計学を例に" : "How to Train Your Swift: Examples of Computational Statistics in Swift"
        )
    )
    
    static let yasuhiroInami = Speaker(
        name: "Yasuhiro Inami",
        twitter: "inamiy",
        image: "inamiy",
        presentation: Presentation(
            title: isJapanese ? "パーサーコンビネーター in Swift" : "Parser Combinator in Swift"
        )
    )
    
    static let jeffHui = Speaker(
        name: "Jeff Hui",
        twitter: "jeffhui",
        image: "jeff",
        presentation: Presentation(
            title: isJapanese ? "ライブラリの開発" : "Creating a Library"
        )
    )
    
    static let ayakaNonaka = Speaker(
        name: "Ayaka Nonaka",
        twitter: "ayanonagon",
        image: "Ayaka",
        presentation: Presentation(
            title: isJapanese ? "実践的 “Boundaries”" : "Boundaries in Practice"
        )
    )
    
    static let simonGladman = Speaker(
        name: "Simon Gladman",
        twitter: "FlexMonkey",
        image: "simon",
        presentation: Presentation(
            title: isJapanese ? "Core Imageによる高度な画像処理" : "Advanced Image Processing with Core Image"
        )
    )
    
    static let cateHuston = Speaker(
        name: "Cate Huston",
        twitter: "catehstn",
        image: "cate",
        presentation: Presentation(
            title: isJapanese ? "目に見えないものを学ぶ" : "How To Be Invisible"
        )
    )
    
    static let danielSteinberg = Speaker(
        name: "Daniel Steinberg",
        twitter: "dimsumthinking",
        image: "dimsumthinking",
        presentation: Presentation(
            title: isJapanese ? "文化を調和させる" : "Blending Cultures"
        )
    )
    
    static let matthewGillingham = Speaker(
        name: "Matthew Gillingham",
        twitter: "gillygize",
        image: "matthewg",
        presentation: Presentation(
            title: isJapanese ? "プロトコルエクステンション: 歴史について" : "Protocol Extensions: A History"
        )
    )
    
    static let lauraSavino = Speaker(
        name: "Laura Savino",
        twitter: "savinola",
        image: "laura",
        presentation: Presentation(
            title: isJapanese ? "コードリーディングについて" : "Learning to Read Again"
        )
    )
    
    static let yutaKoshizawa = Speaker(
        name: "Yuta Koshizawa",
        twitter: "koher",
        image: "koher",
        presentation: Presentation(
            title: isJapanese ? "Swiftのエラー処理についての三つの話" : "Three Stories about Error Handling in Swift"
        )
    )
    
    static let danielEggert = Speaker(
        name: "Daniel Eggert",
        twitter: "danielboedewadt",
        image: "danieleggert",
        presentation: Presentation(
            title: isJapanese ? "モダンCore Data" : "Modern Core Data"
        )
    )
    
    static let helenHolmes = Speaker(
        name: "Helen Holmes",
        twitter: "helenvholmes",
        image: "helen",
        presentation: Presentation(
            title: isJapanese ? "デザイナーをSwiftのコードベースに巻き込む10の方法" : "10 Ways to Get Designers In Your Swift Codebase"
        )
    )
    
    static let yosukeIshikawa = Speaker(
        name: "Yosuke Ishikawa",
        twitter: "_ishkawa",
        image: "ishkawa",
        presentation: Presentation(
            title: isJapanese ? "Protocol-Oriented Programming in Networking" : "Protocol-Oriented Programming in Networking"
        )
    )
    
    static let adamBell = Speaker(
        name: "Adam Bell",
        twitter: "b3ll",
        image: "adambell",
        presentation: Presentation(
            title: isJapanese ? "プロトタイピングの魔法" : "Prototyping Magic"
        )
    )
    
    static let borisBugling = Speaker(
        name: "Boris Bügling",
        twitter: "NeoNacho",
        image: "boris",
        presentation: Presentation(
            title: isJapanese ? "📺" : "📺"
        )
    )
    
    static let hectorMatos = Speaker(
        name: "Hector Matos",
        twitter: "allonsykraken",
        image: "hectormatos",
        presentation: Presentation(
            title: isJapanese ? "Swiftヒップスター" : "Hipster Swift"
        )
    )
    
    static let micheleTitolo = Speaker(
        name: "Michele Titolo",
        twitter: "micheletitolo",
        image: "michele",
        presentation: Presentation(
            title: isJapanese ? "プロトコルと約束の地" : "Protocols and the Promised Land"
        )
    )
    
    static let rachelBobbins = Speaker(
        name: "Rachel Bobbins",
        twitter: "bobbins",
        image: "rachel",
        presentation: Presentation(
            title: isJapanese ? "Swift版「誰のためのデザイン？」" : "The Design of Everyday Swift"
        )
    )
    
    static let danielHaight = Speaker(
        name: "Daniel Haight",
        twitter: "daniel1of1",
        image: "daniel",
        presentation: Presentation(
            title: isJapanese ? "xcodeless - the build system" : "xcodeless - the build system"
        )
    )
    
    static let stephanieShupe = Speaker(
        name: "Stephanie Shupe",
        twitter: "steph_shupe",
        image: "stephanie",
        presentation: Presentation(
            title: isJapanese ? "スマートホームのためのコード" : "Code for the Smart Home"
        )
    )
    
    static let himiSato = Speaker(
        name: "Himi Sato",
        twitter: "himisanta",
        image: "himi",
        presentation: Presentation(
            title: isJapanese ? "Building Women Who Code in Tokyo" : "Building Women Who Code in Tokyo"
        )
    )
    
    static let novallKhan = Speaker(
        name: "Novall Khan",
        twitter: "novallkhan",
        image: "novall",
        presentation: Presentation(
            title: isJapanese ? "SwiftコンパイラとLLDBの連携" : "Swift compiler integration in LLDB"
        )
    )
    
    static let jpSimard = Speaker(
        name: "JP Simard",
        twitter: "simjp",
        image: "jpsimard",
        presentation: Presentation(
            title: isJapanese ? "実践的クロスプラットフォームSwift" : "Practical Cross-Platform Swift"
        )
    )
    
    static let gwendolynWeston = Speaker(
        name: "Gwendolyn Weston",
        twitter: "purpleyay",
        image: "gwen",
        presentation: Presentation(
            title: isJapanese ? "平常心で型を消し去る" : "Keep Calm and Type Erase On"
        )
    )
    
    static let maximCramer = Speaker(
        name: "Maxim Cramer",
        twitter: "mennenia",
        image: "Maxim",
        presentation: Presentation(
            title: isJapanese ? "ライブデザイニング:🎙🎨 " : "Live Design:🎙🎨 "
        )
    )
}
