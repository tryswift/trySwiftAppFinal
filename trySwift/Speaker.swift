//
//  Speaker.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit
import Toucan

struct Speaker {
    let name: String
    let twitter: String
    let image: UIImage
    let bio: String
    let presentation: Presentation
}

extension Speaker {
    
    static let speakers = [ashFurrow, natalieBerdys, jesseSquires, syoIkeda, veronicaRay, chrisEidhof, timOliver, hirokiKato, dianaZmuda, yasuhiroInami, jeffHui, ayakaNonaka, simonGladman, cateHuston, danielSteinberg, matthewGillingham, lauraSavino, yutaKoshizawa, danielEggert, helenHolmes, yosukeIshikawa, adamBell, borisBugling, hectorMatos, micheleTitolo, rachelBobbins, danielHaight, stephanieShupe, himiSato, novallKhan, jpSimard, gwendolynWeston, maximCramer].sort { $0.name < $1.name }
    
    static let ashFurrow = Speaker(
        name: "Ash Furrow",
        twitter: "ashfurrow",
        image: Toucan(image: UIImage(named: "ashfurrow")!).maskWithEllipse().image,
        bio: isJapanese ? "iOSエンジニアおよび著者としてArtsyで働くカナダ人です。多くのアプリを開発し、これまで4冊の書籍を出版しています。また、オープンソースのコントリビューターとしてコミュニティに関わっています。ブログでは、興味深いプログラミングのネタからフィルムカメラにまでおよぶ様々なトピックを扱っています。" : "Ash Furrow is a Canadian iOS developer and author, currently working at Artsy. He has published four books, built many apps, and is a contributor to the open source community. On his blog, he writes about a range of topics, from interesting programming to explorations of analogue film photography.",
        presentation: Presentation(
            title: isJapanese ? "Artsyにおけるテスト手法の紹介" : "An Artsy Testing Tour",
            summary: isJapanese ?
                "Artyは４つのiOSアプリケーションを提供しています。すべてオープンソースとして公開しています。そしてすべて異なるアプローチを用いてテストされています。なぜでしょうか？それぞれ異なるテスト手法を用いることは、異なる環境においてうまく動くからです。ArtsyのiOSチームの判断の裏付けとなった議論や、どんな問題にあたり、どのように課題を解決したのかを紹介します。すばらしいソフトウェアを作るために、なぜテストが重要なのかをより理解できるようになるでしょう。" :
                "Artsy has four iOS applications; all of them are open source, and all of them take different approaches to testing. Why? Because different testing techniques work better or worse in different circumstances. Come hear Ash Furrow discuss the motivations behind the Artsy iOS team's decisions, what struggles they encountered, and how they overcame those challenges. You will leave with a better understanding of when and why testing is important to building fantastic software.")
    )
    
    static let natalieBerdys = Speaker(
        name: "Natalia Berdys",
        twitter: "batalia",
        image: Toucan(image: UIImage(named: "natalia")!).maskWithEllipse().image,
        bio: isJapanese ? "iOS開発のリードエンジニアとして、ポーランドのソフトウェアハウスTutu Labに勤務しています。この２年間で独学でエンジニアになり、モバイルエンジニアリングの学位を取得、さらに、WWDCにてスピーチをしました。また、彼女のアプリは47カ国でNo.1を獲得しました。アメリカ文学の学位保持者のため、プログラミングに対して人文的かつ詩的な視点を持っています。" : "Natalia Berdys is the lead iOS Developer at Tutu Lab, an indie studio in Poland. Within 2 years, she managed to become a self-taught developer, get a Mobile Engineering degree, speak at Apple WWDC and take her apps to #1 in 47 countries. Since she also holds a Master’s Degree in American Literature, she has a very humanistic and poetic view of programming.",
        presentation: Presentation(
            title: isJapanese ? "SpriteKitにワクワクする" : "Livin’ on the edge with Sprite Kit",
            summary: isJapanese ? "ゲームを開発することは、威圧し圧倒する、\"外人\"が初めての日本旅行でパチンコホールに入ってしまうようなことに少し似ています。SpriteKit、古いパチンコにインスパイアされたこの講演では、いくつかの便利なテクニックや非常に早くプロトタイピングをする方法を紹介します。SpriteKitの世界が今ひとつ理解できてなくても心配いりません。" : "Making games can be intimidating and overwhelming - a bit like a gaijin walking into a crazy pachinko parlor during their first trip to Japan. Sprite Kit, however, takes the edge off! This talk, inspired by a vintage pachinko game, will take you through some nifty techniques and lightning-fast prototyping to make your life easier - even if you’re a lost tourist in the Sprite Kit world.")
    )
    
    static let jesseSquires = Speaker(
        name: "Jesse Squires",
        twitter: "jesse_squires",
        image: Toucan(image: UIImage(named: "squires")!).maskWithEllipse().image,
        bio: isJapanese ? "InstagramでiOSアプリを開発しているソフトウェアエンジニアです。jessesquires.comにてSwiftやObjective-Cに関するブログを書いています。Github上で多くのオープンソースプロジェクトにコントリビュートしています。走ることと新しいことを学ぶのが好きで、主にブラックコーヒーとブラックメタルによって元気になります。" : "Jesse is a software developer who works on iOS at Instagram. He writes about Swift and Objective-C on his blog at jessesquires.com, and contributes to many open-source projects on GitHub. He loves running and learning new things, and is fueled primarily by black coffee and black metal.",
        presentation: Presentation(
            title: isJapanese ? "オープンソースSwiftへの貢献" : "Contributing to open source Swift",
            summary: isJapanese ? "Swiftに貢献したいですか？どのように、また、どこから取り掛かればいいか分かりませんか？パッと見て圧倒されるかもしれません。この講演では、さまざまなSwiftのプロジェクトがどのように関係しているかを見て、貢献し始めるために必要なスキルを議論し、あなたが行うであろう最初の変更が承認されるためのベストな方法を学びます。" : "Do you want to contribute to Swift? Not sure how or where to begin? It can be overwhelming! In this talk we'll explore the different parts of Swift, see how the various Swift projects are related, discuss the skills you need to get started, and learn the best ways to get your first fix accepted. ")
    )
    
    static let syoIkeda = Speaker(
        name: "Syo Ikeda",
        twitter: "ikesyo",
        image: Toucan(image: UIImage(named: "syo")!).maskWithEllipse().image,
        bio: isJapanese ? "京都在住のiOSエンジニアで、はてなで働いています。（Twitter上では@ikesyoで知られています。）オープンソースの活動として、Himotoki（type-safeなJSONパーサーライブラリ）の開発やReactiveCocoaやCarthageといったオープンソースのプロジェクトにコントリビュートしています。" : "Syo Ikeda (a.k.a @ikesyo) is an iOS developer lives in Kyoto, working at Hatena. He is the author of Himotoki, a type-safe JSON decoding library made of Swift, and also is contributing to several open source projects such as ReactiveCocoa and Carthage.",
        presentation: Presentation(
            title: isJapanese ? "Swiftのエコシステムに飛び込む" : "Dive into Swift Ecosystem",
            summary: isJapanese ? "Swiftはこの2年のうちに非常に人気のある言語になり、いまやオープンソース化されました。エコシステムは日々拡大しており、Swiftをサポートするサービスが出てきたり、多くの開発者向けツールがSwiftで書かれています。講演ではそういったツールやサービスを紹介し、それらを使ったり、貢献することをお勧めします。大きなチャンスです:-)" : "Swift became a very popular programming language in this two years and is now open sourced. Its ecosystem should be growing day by day and there are already some services those support Swift or many developer tools themselves are written in Swift. I will introduce the services and tools, and encourage you to use, participate in or contribute to them. It's a great chance to do so! :-)")
    )
    
    static let veronicaRay = Speaker(
        name: "Veronica Ray",
        twitter: "nerdonica",
        image: Toucan(image: UIImage(named: "veronica")!).maskWithEllipse().image,
        bio: isJapanese ? "LinkedInのビデオチームに所属するソフトウェアエンジニアです。以前自転車でヘラジカの間を通り抜けたことがあります。MediumのブログとTwitterでは@nerdonicaとして活動しています。" : "Veronica Ray is a software engineer at LinkedIn on the Video team. Once she rode her bike between two moose. She blogs on Medium and is on Twitter as  @nerdonica.",
        presentation: Presentation(
            title: isJapanese ? "Swiftにおける実践的なモック化について" : "Real World Mocking In Swift",
            summary: isJapanese ? "モックを使うと、プロダクションのデータが揃うのを待たずに、早くテストを書くことができます。OCMockを使わずにモックを書く場合でも、それほど多くの作業が発生するわけではありません。講演では、コードベースの多くの重要な箇所に対して簡単でメンテナンスしやすい実践的なモックを作るためのテクニックをSwiftで説明します。" : "Mocks allow us to write fast tests that don’t mess with production data. Without OCMock we will need to write our own mocks, but it doesn’t have to be a lot of work. We will look at techniques for practical mocking in Swift that will allow us to create simple, easy to maintain mocks for the most important parts of our codebase. ")
    )
    
    static let chrisEidhof = Speaker(
        name: "Chris Eidhof",
        twitter: "chriseidhof",
        image: Toucan(image: UIImage(named: "chris")!).maskWithEllipse().image,
        bio: isJapanese ? "ドイツ・ベルリンに住むオランダ人のソフトウェア開発者です。iOS/Macアプリ開発を中心に活動しており、DecksetやSceneryを開発しています。UIKonfやobjc.ioの立ち上げ、Functional Programming in Swift, Advanced Swift（現在、執筆中）の著者でもあります。" : "Chris is a Dutch software developer living in Berlin (Germany). He spends most of his time building iOS and Mac apps, such as Deckset and Scenery. He started UIKonf, objc.io, wrote a book about Functional Programming in Swift and is currently writing a book on Advanced Swift.",
        presentation: Presentation(
            title: isJapanese ? "SwiftらしいTable View Controllerの使い方" : "Table View Controllers in Swift",
            summary: isJapanese ?
                "この講演ではよりSwiftらしいTable View Controllerの使い方を探ります。ジェネリクスやStruct、再利用可能なUITableViewControllerのサブクラスを作る関数などについて話します。" :
                "In this talk, we'll look at how we can work with table view controllers in a more Swifty way. We'll use generics, structs and functions to create a reusable subclass of UITableViewController."))

    static let timOliver = Speaker(
        name: "Tim Oliver",
        twitter: "TimOliverAU",
        image: Toucan(image: UIImage(named: "timoliver")!).maskWithEllipse().image,
        bio: isJapanese ? "オーストラリア・パースの出身です。6年間iOS開発に携わっており、2015年3月にRealmにジョインしました。App StoreではiComicsというクールなアプリをリリースしてます。カラオケが大好きです!" : "Tim Oliver hails from Perth, Australia! He has been an iOS developer for 6 years, and recently joined Realm in March 2015. Tim has a cool app called iComics and he loves karaoke!",
        presentation: Presentation(
            title: isJapanese ? "Core Animationで作る高度なグラフィックス" : "Advanced Graphics with Core Animation",
            summary: isJapanese ? "iOSならアニメーションがUXに対してとても大事なことです。それでUIKitのAPIのおかげで実装するのが既にとても簡単です。しかし、UIKitの下のレベル、Core Animationも利用したら、自分のアプリにもっとかっこよくて、もっときれいなアニメーションも可能性になります。このプレゼンテーションはiOSでCore Animationの実装方法やエフェクトのデモンストレーションを説明します。" : "Animation is one of the cornerstones of the UI experience on iOS, and thanks to the animation APIs in UIKit, it's incredibly easy. However, by dropping down to Core Animation level, it's possible to create even more dynamic and impressive animations that can really help make your app stand out. This talk will cover the concepts of how Core Animation works in iOS, how to work with the API, as well as examples on what sorts of animations and effects it can enable in your app. ")
    )
    
    static let hirokiKato = Speaker(
        name: "Hiroki Kato",
        twitter: "cockscomb",
        image: Toucan(image: UIImage(named: "hiroki")!).maskWithEllipse().image,
        bio: isJapanese ? "はてなのソフトウェアエンジニアです。学生時代にMac/iOSアプリ開発からエンジニアとしてのキャリアをスタートしました。Apple、Cocoa (touch), Objective-C そして Swift が大好きです。" : "Software Engineer, working at Hatena in Kyoto. I started my career as a developer of OS X/iOS apps when I was a student. I’m loving Apple, Cocoa (touch), Objective-C and Swift.",
        presentation: Presentation(
            title: isJapanese ? "Motivation based library abstraction" : "Motivation based library abstraction",
            summary: isJapanese ? "最近、自分が直面した問題を解決するためのライブラリを作ることがあります。そのようなライブラリは、実際の問題に対する解決策を具現化したものです。今日のSwiftには、解決するべき課題がたくさんあることでしょう。現実のモチベーションに裏付けられた、役に立つライブラリを作ってみませんか。" : "I recently developed some libraries to resolve the problems I was faced with. Such libraries would have a concrete solution to them. There should be many subjects to address in Swift now. Let's make useful libraries based on real motivation together.")
    )
    
    static let dianaZmuda = Speaker(
        name: "Diana Zmuda",
        twitter: "dazmuda",
        image: Toucan(image: UIImage(named: "diana")!).maskWithEllipse().image,
        bio: isJapanese ? "thoughtbotに所属しているiOSエンジニアです。iOS on Railsと呼ばれるAPIと連携するモバイルアプリ開発に関する書籍を共同執筆しました。また、App Camp for Girlsのインストラクターもしています。ときおり、iOS関連のジョークを@dazmudaにてツイートしています。" : "Diana is an iOS developer at thoughtbot. She co-wrote a book about building mobile apps in tandem with APIs called iOS on Rails. She's also an instructor for App Camp for Girls, a summer camp where young girls learn how to write software. Occasionally, she tweets iOS related puns @dazmuda.",
        presentation: Presentation(
            title: isJapanese ? "Swiftトレーニング: 統計学を例に" : "How to Train Your Swift: Examples of Computational Statistics in Swift",
            summary: isJapanese ?
                "Swiftの使いやすさとエレガントさはシンプルな数学の概念を探求しようとする数学愛好者にとって完璧なものです。この講演では、統計的なランキングデータと、特徴語の集合（BoW、Bag of Words）を新しいエレメントを分類するために使用し、マルコフ連鎖アルゴリズムを完全なデータポイントを生成するために使用します。講演の間に、さまざまな数式をSwiftだけで実装し、ソート、分類、データ生成にSwiftを利用するさまをお見せします。" :
                "Swift's ease of use and elegance of form make it perfect for math hobbyists looking to explore simple mathematical concepts. In this talk we'll use a statistical model to rank data, a bag-of-words model to classify new elements, and a Markov Chain algorithm to generate entirely new data points. Over the course of this session, we'll walk through a variety of examples of exciting formulas implemented entirely in Swift, building up to a program trained to sort, classify, and generate data."))
    
    static let yasuhiroInami = Speaker(
        name: "Yasuhiro Inami",
        twitter: "inamiy",
        image: Toucan(image: UIImage(named: "inamiy")!).maskWithEllipse().image,
        bio: isJapanese ? "LINEでiOSエンジニアをしています。業務ではメッセンジャー、カメラ、ニュースといったアプリ開発に関わる一方、プライベートではReactKitやSwiftTaskといったオープンソースプロジェクトにコントリビュートしています。Apple、SwiftそしてHearthstoneの大ファンです。Battle.netやGitHub: https://github.com/inamiy で出会うことができます。" : "Yasuhiro is an iOS developer at LINE Corporation. While creating iPhone apps such as messenger, camera, news app in his work, he also spends time on making open source projects, e.g. ReactKit and SwiftTask. He is a big fan of Apple, Swift, and Hearthstone. You can find him at Battle.net or GitHub: https://github.com/inamiy.",
        presentation: Presentation(
            title: isJapanese ? "パーサーコンビネーター in Swift" : "Parser Combinator in Swift",
            summary: isJapanese ? "パーサーコンビネーターは、関数型プログラミングにおける最も美しいコード記述法の一つです。JSON構文木などを簡単に生成することができます。このプレゼンテーションでは、パーサーコンビネーターが実際にどのように動作し、活用されているのか、具体例を交えて解説します。" : "Parser-combinator is one of the most awesome functional technique to parse strings into parse tree, e.g. constructing JSON. In this presentation, we will look into how they actually work by combining small parsers together to form a complex and practical ones.")
    )
    
    static let jeffHui = Speaker(
        name: "Jeff Hui",
        twitter: "jeffhui",
        image: Toucan(image: UIImage(named: "jeff")!).maskWithEllipse().image,
        bio: isJapanese ? "iOS開発に特化したフルスタックエンジニアです。コンサルタントとして多くのiOSアプリ開発プロジェクトに従事しています。活発にオープンソースにコントリビュートしており、テストフレームであるQuick/Nimbleのコアチームメンバーです。" : "Jeff Hui is an full-stack engineer specializing in iOS development. He’s worked on a number of iOS apps as a consultant. He’s an active open source contributor and the core team member to Quick & Nimble testing frameworks.",
        presentation: Presentation(
            title: isJapanese ? "Nimbleの内部構造" : "Nimble Internals",
            summary: isJapanese ? "NimbleはBDDのためのアサーションライブラリで、BDDフレームワークQuickの一部になっています。言語機能の裏側とNimbleが安全で簡潔なAPIを提供するために使っているテクニックを解説します。" : "Nimble is a BDD assertion library that's part of the Quick BDD Framework. We'll tear under the hood at the language features and techniques Nimble uses to provide an safe and concise API."))
    
    static let ayakaNonaka = Speaker(
        name: "Ayaka Nonaka",
        twitter: "ayanonagon",
        image: Toucan(image: UIImage(named: "Ayaka")!).maskWithEllipse().image,
        bio: isJapanese ? "AyakaはVenmoのiOSリードで最近はSwiftばかり書いています。iOS 4の頃からiOS開発を始め、テイラー・スウィフトの曲を聴きながらSwiftを書くのが大好きです。これまでSwiftにおける自然言語処理や、スクリプティング、VenmoアプリをSwiftで書き直したことなどをテーマに講演を行いました。東京出身なので、東京のカンファレンスで話せることがとても楽しみです！「宜しくお願いします。」" : "Ayaka leads the iOS team at Venmo where they write only Swift these days. She’s been doing iOS development since iOS 4 and loves writing Swift while listening to Taylor Swift. In the past, she’s given talks on NLP in Swift, Swift Scripting, and rewriting the Venmo app in Swift. She was born in Tokyo and can’t wait to give her first talk there! 宜しくお願いします。",
        presentation: Presentation(
            title: isJapanese ? "実践的 “Boundaries”" : "Boundaries in Practice",
            summary: isJapanese ? "Gary BernhardtさんのBoundariesという講演 https://www.destroyallsoftware.com/talks/boundaries) をご存知でしょうか。関数型プログラミングの講演ではよく言及されています。私は数年前に初めてこの講演を聴いたとき、「Functional Core, Imperative Shell」を理論的には理解できたのですが、実際の場面でにどのようにこの概念を適用できるのかよく分かりませんでした。しかし、毎日少しずつSwiftを書いているうちに、この概念は関数型プログラミングだけではなく、良いエンジニアリングに一般的に適用できることがわかってきました。今回は「Boundaries」をどのように利用して、より良い、より安全な、そして将来性のあるSwiftを書くことができるのかを、いくつかの事例を紹介しながらお話しします。「Boundaries」をご覧になったことがなくても私の話をご理解いただけると思いますが、もしお時間があればぜひ一度ご覧ください。すばらしい講演です。" : "One of the talks that I’ve enjoyed watching is Boundaries by Gary Bernhardt(https://www.destroyallsoftware.com/talks/boundaries). If you’ve seen a talk about functional programming in Swift, you’ve probably heard it being referenced. When I first watched the talk a few years ago, I understood the theory but wasn’t sure where exactly to apply the concepts. As I’ve been writing more and more Swift, I started to see that the concept of “Functional Core, Imperative Shell” applies not just to functional programming, but also to good engineering in general. In this talk, we’ll go over a couple of specific examples how these “boundaries” can help us write better, safer, and more future-proof Swift code. You don’t need to watch the Boundaries talk to understand this talk, but if you have time, definitely watch it because it’s a great talk.")
    )
    
    static let simonGladman = Speaker(
        name: "Simon Gladman",
        twitter: "FlexMonkey",
        image: Toucan(image: UIImage(named: "simon")!).maskWithEllipse().image,
        bio: isJapanese ? "Simonは初期のSwift言語のチャンピオンです。彼のブログ(http://flexmonkey.blogspot.co.uk)はiOSのテクノロジーを探求・検証する際の人気のソースになっています。いくつものiOSアプリをリリースしており、その中にnode.jsベースのiPad用画像処理アプリであるNodalityも含まれています。余暇は、物理・粒子シミュレーション・画像処理・今までにないユーザインタラクションといったよりクリエイティブな方向性の取り組みをしています。" : "An early champion of Apple's Swift language, Simon's blog, http://flexmonkey.blogspot.co.uk, has become a popular source for articles exploring and experimenting with iOS technology. Simon has published several iOS apps including Nodality, a node based image editing app for iPads. In his spare time, his coding takes a more creative direction where his interests include topics such as physics and particle simulations, image processing and novel user interaction patterns.",
        presentation: Presentation(
            title: isJapanese ? "Core Imageによる高度な画像処理" : "Advanced Image Processing with Core Image", summary: isJapanese ? "Core ImageはAppleが提供している画像処理・解析用フレームワークです。170以上の組み込みフィルタ（単独でも組み合わせても使えます）とカスタムフィルタを自分で作ることもできるので、Core Imageは静止画および動画に適用可能な視覚効果に対するとてつもないポテンシャルを提供しています。この講演では、Core Imageの基本から上級テクニックまでご紹介します。" : "Core Image is Apple's framework for image processing and analysis. With over 170 built in filters - which can be used alone or together in complex graphs - and support for custom image kernels, Core Image offers unlimited creative potential for visual effects that can be applied to still or moving images. In this talk, we'll look at Core Image from its very basics right through to advanced techniques.")
    )
    
    static let cateHuston = Speaker(
        name: "Cate Huston",
        twitter: "catehstn",
        image: Toucan(image: UIImage(named: "cate")!).maskWithEllipse().image,
        bio: isJapanese ? "Rideにてモバイルエンジニアリングのディレクターをしています。UK、オーストラリア、カナダ、中国、アメリカに居住した経験を持ち、Googleではエンジニア、IBMではExtreme Blueインターン、スキーのインストラクターとして働いた経験があります。国際的にモバイル開発の講演をしており、執筆に関してはLifehacker、The Daily Beast、The Eloquent Woman、Model View Cultureといったサイトに掲載されております。Glowforgeにてアドバイザーをしており、Accidentally in Codeでブログも書いています。また、Twitterは@catehstnで活動しています。" : "Cate Huston is Director of Mobile Engineering at Ride. She’s lived and worked in the UK, Australia, Canada, China and the United States, previously as an engineer at Google, an Extreme Blue intern at IBM, and a ski instructor. Cate speaks internationally on mobile development and her writing has been published on sites as varied as Lifehacker, The Daily Beast, The Eloquent Woman and Model View Culture. She is an advisor at Glowforge, co-curates Technically Speaking, blogs at Accidentally in Code and is @catehstn on Twitter.",
        presentation: Presentation(
            title: isJapanese ? "目に見えないものを学ぶ" : "How To Be Invisible",
            summary: isJapanese ? "特にモバイルにおいては、ほとんどの製品は2つの陣営に分類されます。時間かお金か、です。時間は\"digital crack\"と捉えることもできます。それは予測不能な報酬による中毒性とも言えます。お金は、ユーザーがより効果的に、ときには最高のユーザー体験がまったくなされてないことがあります。私たちは目に見えないものを学ばなければなりません。" : "On mobile especially, most products fall into one of two camps - minutes or dollars. Minutes can also be thought of as “digital crack” - the addictive nature of an unpredictable reward. Dollars means helping our users be more effective, and sometimes the best user experience is no user experience at all; we must learn to be invisible."))
    
    static let danielSteinberg = Speaker(
        name: "Daniel Steinberg",
        twitter: "dimsumthinking",
        image: Toucan(image: UIImage(named: "dimsumthinking")!).maskWithEllipse().image,
        bio: isJapanese ? "Danielはベストセラーになった「A Swift Kickstart」と「Developing iOS 7 Apps for iPad and iPhone」の著者です。（この２冊の本は、iTunes Uで人気のスタンフォード大学のiOS開発の講義の公式の参考書になっています。）iPhoneとiPadアプリの開発をSDKが出た当初から始め、Macアプリに至ってはSyntem 7の頃から携わっています。また、iPhone、Cocoa、およびSwiftについてのトレーニングとコンサルティングを彼のDim Sum Thinking社で行っています。" : "Daniel is the author of the best selling books A Swift Kickstart and Developing iOS 7 Apps for iPad and iPhone (the official companion book to the popular iTunes U series from Stanford University). He has written apps for the iPhone and the iPad since the SDKs first appeared and has written programs for the Mac all the way back to System 7.Daniel presents iPhone, Cocoa, and Swift training and consults through his company Dim Sum Thinking.",
        presentation: Presentation(
            title: isJapanese ? "文化を調和させる" : "Blending Cultures",
            summary: isJapanese ? "Swiftでアプリケーションを書くということはObjective-Cで書かれたアプリケーションをただSwiftに書き換えるだけでなく、Swiftの特徴や哲学を受け入れる必要があります。この講演では、標準的なMVCで構成されたテーブルビューを使用したアプリケーションをSwiftに書き換えるところから始まり、よりSwiftらしいコードにするために、関数型プログラミング、オブジェクト指向プログラミング、デザインパターン、プロトコル指向プログラミングの考え方を適用していきます。" : "A Swift application is more than just an Objective-C app translated into Swift. We need to embrace the features and philosophy of the Swift language. In this talk, we begin with a standard Model-View-Controller TableView application translated into Swift and apply ideas from Functional Programming, Object Oriented Programming, Design Patterns, and Protocol Oriented Programming to turn it into idiomatic Swift."))
    
    static let matthewGillingham = Speaker(
        name: "Matthew Gillingham",
        twitter: "gillygize",
        image: Toucan(image: UIImage(named: "matthewg")!).maskWithEllipse().image,
        bio: isJapanese ? "Tonchidot, GREE, Mediweb、Eventacularといった日本企業で7年間iOS開発をしています。また、5年以上もAppleのプラットフォーム上で開発している人達の国際的なコミュニティであるTokyo iOS Meetupのオーガナイザーをしています。" : "Matthew Gillingham has been an iOS developer for seven years, working at Japanese companies such as Tonchidot, GREE, Mediweb, and Eventacular. He has also been organizing the Tokyo iOS Meetup, an international community of people making things on Apple platforms, for over five years.",
        presentation: Presentation(
            title: isJapanese ? "プロトコルエクステンション: 歴史について" : "Protocol Extensions: A History",
            summary: isJapanese ? "Swift 2.0のプロトコルエクステンションに至るまでの、プログラミング言語におけるコードの再利用と共通化の歴史をお話しします。" : "A brief history of programming language features which permit code-sharing and code-reuse, leading up the protocol extensions in Swift 2.0.")
    )
    
    static let lauraSavino = Speaker(
        name: "Laura Savino",
        twitter: "savinola",
        image: Toucan(image: UIImage(named: "laura")!).maskWithEllipse().image,
        bio: isJapanese ? "言語、旅行、教育に強い興味を持っているiOSエンジニアです。Khan Academyにて、アプリを作り、学ぶ過程で学生のアカデミックな経験を活かす取り組みをしています。フリーでコーダー、発表者、トレーナーをしています。" : "Laura is an iOS developer with a penchant for languages, travel, and education. She most recently worked to transform students' academic experience by building apps for learning at Khan Academy, and is now an independent coder, speaker, and trainer.",
        presentation: Presentation(
            title: isJapanese ? "コードリーディングについて" : "Learning to Read Again",
            summary: isJapanese ?
                "新しいコードを読み解くことを、私たちはしばしば行いますが、それはエネルギーと時間を消費します。そこで、スラスラと新しい言語を読めるようにする方法と、進化に付いていく方法をお話しします。" :
                "Puzzling over new code takes energy and time, and we're often short on both. So how can we learn to read fluently in this new language, especially as it keeps changing?"))
    
    static let yutaKoshizawa = Speaker(
        name: "Yuta Koshizawa",
        twitter: "koher",
        image: Toucan(image: UIImage(named: "koher")!).maskWithEllipse().image,
        bio: isJapanese ? "QonceptでiOS開発をしています。また、サイドプロジェクトとしてarticles.eachというiOSアプリも開発しています。Qiitaに投稿しているSwiftの記事は日本のiOS開発者の間で人気です。" : "Yuta is an iOS developer at Qoncept. He is also developing an iOS app [articles.each {](articles-each.github.io) as his side project. His posts about Swift on Qiita, Japanese blogging service specialized for programming, are popular with iOS developers in Japan.",
        presentation: Presentation(
            title: isJapanese ? "Swiftのエラー処理についての三つの話" : "Three Stories about Error Handling in Swift",
            summary: isJapanese ? "エラー処理は安全なコードを書く上で重要です。私のプレゼンテーションでは、主に私の経験と考えに基いて、また `Error Handling Rationale and Proposal` と swift-evolution のメーリングリストでの議論にも触れながら、 Swift におけるエラー処理の論点を整理します。" : "Error handling is important to write safe codes. In my presentation, I will organize the issues of error handling in Swift mainly based on my experience and thinking referring to `Error Handling Rationale and Proposal` and discussions on the swift-evolution mailing list.")
    )
    
    static let danielEggert = Speaker(
        name: "Daniel Eggert",
        twitter: "danielboedewadt",
        image: Toucan(image: UIImage(named: "danieleggert")!).maskWithEllipse().image,
        bio: isJapanese ? "写真を愛し、ベルリンに住んでいます。objc.ioの共同設立者の一人です。10年以上、Cocoaに関係する全て（主に写真や画像処理）に関わって仕事をしています。5年間Appleで働き、Photos.appとCamera.appをCore Dataに移行する仕事をしました。" : "Daniel loves photography and lives in Berlin. He is one of the co-founders of objc.io. He’s been working with all kinds of things related to Cocoa for more than ten years — mostly photo and image processing related. Daniel worked at Apple for five years, and helped move Photos.app and Camera.app to Core Data.",
        presentation: Presentation(
            title: isJapanese ? "モダンCore Data" : "Modern Core Data",
            summary: isJapanese ? "Swiftを使い、古いObjective-CのAPIに新たな命を吹き込みます。" : "Use Swift to breathe new life into an old Objective-C API"))
    
    static let helenHolmes = Speaker(
        name: "Helen Holmes",
        twitter: "helenvholmes",
        image: Toucan(image: UIImage(named: "helen")!).maskWithEllipse().image,
        bio: isJapanese ? "誰でも正しいサポートがあればプログラミングを学べると考えているデザイナーです。技術を全ての人に対して適切なコミュニティにすることの提唱者です。Women Who Code DC’s chapterの設立に協力し、アメリカ全土で学生ハッカソンのメンターをしています。現在、Mozillaで開発ツールを誰にとってもより良くする仕事をしています。" : "Helen is a designer who figures anyone can learn to program with the right support. A big proponent of making tech a healthy community for all, she helped found Women Who Code DC’s chapter and has mentored at student hackathons all over the U.S. She’s currently at Mozilla helping make devtools a little better for everyone.",
        presentation: Presentation(
            title: isJapanese ? "デザイナーをSwiftのコードベースに巻き込む10の方法" : "10 Ways to Get Designers In Your Swift Codebase",
            summary: isJapanese ? "デザイナーが開発者と蜜に連携することは多くのメリットがあります。アプリケーションの設計を飛躍的に改善するために行った技術的な判断をデザイナーに伝えることで、、デザイナーをコードベースに巻き込む方法について解説します。" : "Getting designers working closely with developers has a lot of benefits. I’ll show you how to get designers into your code base by explaining the engineering architectural decisions you can make to make your app designs improve exponentially. ")
    )
    
    static let yosukeIshikawa = Speaker(
        name: "Yosuke Ishikawa",
        twitter: "_ishkawa",
        image: Toucan(image: UIImage(named: "ishkawa")!).maskWithEllipse().image,
        bio: isJapanese ? "メルカリで働くiOSエンジニアです。APIKitというSwiftの言語機能を活かしたネットワークライブラリの開発者でもあります。最近は川遊びに夢中になっています。" : "Yosuke Ishikawa works as a software engineer at Mercari, writing code for iOS apps and server side apps. He created APIKit, which is a networking library that aims at taking advantage of the language features.",
        presentation: Presentation(
            title: isJapanese ? "Protocol-Oriented Programming in Networking" : "Protocol-Oriented Programming in Networking",
            summary: isJapanese ? "Protocol-Oriented ProgrammingはWWDC 2015で紹介された新しいプログラミングのコンセプトです。この講演では、Protocol-Oriented Programmingがなぜネットワーキングに適しているのか、また、型安全性やコードのシンプルさにどのように貢献するのか説明します。実際のアプリケーション開発で使えるような実例や、RxSwiftと組み合わせた発展的な実例についても紹介します。" : " Protocol-Oriented Programming is a new concept introduced at WWDC 2015. This talk describes why Protocol-Oriented Programming is a good choice for networking and how it contributes type-safety and code simplicity. This talk also contains practical examples and advanced examples with RxSwift.")
    )
    
    static let adamBell = Speaker(
        name: "Adam Bell",
        twitter: "b3ll",
        image: Toucan(image: UIImage(named: "adambell")!).maskWithEllipse().image,
        bio: isJapanese ? "Adam Bellはカナダ人のiOSエンジニアでJailbreakコミュニティでiOSの活動を始め、現在はリバースエンジニアリングとオープンソース活動をしています。普段はアニメーション、音楽、プロトタイプをしているか、ソフトウェアのビットを操作する以外は、レゴで遊ぶかポケモンを育てています。以前はARTPOP、MessageBoxやIgnitionのプロジェクトに従事していました。現在はFacebookでiOSエンジニアとして働いており、アニメーションエンジン「Pop」などのプロジェクトのメンテナンスに関わっています" : "Adam Bell is a Canadian iOS engineer who started out in the jailbreak community reverse-engineering and developing Open Source projects for the platform. When he’s not playing with Lego or training Pokémon, he’s usually playing with animations, music, prototypes, or messing with bits of software he probably shouldn’t. Previous projects include ARTPOP, MessageBox, and Ignition. He's now currently working on iOS Experiences at Facebook and is helping maintain projects like Pop.",
        presentation: Presentation(
            title: isJapanese ? "プロトタイピングの魔法" : "Prototyping Magic",
            summary: isJapanese ?
                "最後にアプリケーションの動きが非現実的、もしくは物理法則に従ってないと感じたことはいつですか？近年のアプリケーションは\"フラットでシンプル\"になっています。魔法のように感じられるアプリは非常に稀になっています。すぐれたジェスチャやアニメーションを備えたアプリケーションを作るために、プロトタイピングの方法を深く学ぶ必要があります。そして、失われた昔の魔法のようなアプリケーションを再現しましょう。" :
                "When was the last time you used an app that felt surreal, or broke the laws of physics? With modern apps becoming \"flat and simple\", apps that felt magical are becoming exceedingly rare! We'll be doing a deep-dive on how to prototype and build great interactive gestures and animations with Swift, so we can restore that sense of magic that's been lost with time."))
    
    static let borisBugling = Speaker(
        name: "Boris Bügling",
        twitter: "NeoNacho",
        image: Toucan(image: UIImage(named: "boris")!).maskWithEllipse().image,
        bio: isJapanese ? "Borisはベルリン在住のCocoaデベロッパーです。現在はContentfulでiOSのSDKを開発に携わっています。Java開発者としての一面や、たくさんのiOSアプリを開発した経験を持っています。彼はまたオープンソースの強力なコントリビュータでもあります。Xcodeをより使いやすくするためのプラグインを開発したり、“Senior VP of Evil”という肩書きでCocoaPodsの不具合を直しています。Ya tu sabes.（それじゃ、また。）" : "Boris is a Cocoa developer from Berlin, who currently works on the iOS SDK at Contentful. A Java developer in another life, with many iOS apps under his belt, he is also a strong open source contributor, building plugins to tame Xcode, and bashing bugs as the CocoaPods “Senior VP of Evil“",
        presentation: Presentation(
            title: isJapanese ? "📺" : "📺",
            summary: isJapanese ? "新しいApple TV向けの設計、開発方法の概要、tvOSのUIコンポーネント、フレームワーク、iOSとの違い、既存のアプリケーションを移植する方法を説明します。" : "This talk will give you an overview on designing and developing for the new Apple TV. Learn about the tvOS UI components, available frameworks, what makes it different from iOS and how to port existing apps."))
    
    static let hectorMatos = Speaker(
        name: "Hector Matos",
        twitter: "allonsykraken",
        image: Toucan(image: UIImage(named: "hectormatos")!).maskWithEllipse().image,
        bio: isJapanese ? "素晴らしい州であるテキサスでラマによって育てられ、ゼルダの伝説をしたり、Game of Thronesを見ながらテレビの前で叫んだりするカウチポテトとして成長しました。家では座ってのんびり過ごさず、KrakenDev.ioでブログを書いている一方、Capital Oneのオフィスではデスクに座ってiOSやAndroidのモバイルアプリの開発をしています。モバイルのUI/UXに強いこだわりをもっており、彼の書くコードは世界をよくしています。Boris, ya tu sabes." : "Raised by llamas in the great state of Texas, Hector grew to be an avid couch potato who likes spending his precious couch time playing the Legend of Zelda or yelling at the TV whilst watching Game of Thrones. While he isn’t sitting at home vegging out, blogging or working on KrakenDev.io, you can find him sitting at the office writing iOS & Android mobile apps for Capital One. With a particular penchant for great mobile UI/UX, Hector writes the code that makes the world go round. Boris, ya tu sabes.",
        presentation: Presentation(
            title: isJapanese ? "Swiftヒップスター" : "Hipster Swift",
            summary: isJapanese ? "Swiftにはあまり知られていない多くの細かい機能があります。それを知っていれば開発にかかる時間や労力を削減することができます。少しの重要な機能を覚えるだけです。この講演では、Swiftのあまり見慣れない機能を多数、初心者にも分かりやすいように解説します。講演後は、日々の開発中に出くわす見慣れない構文を、一目で解読できるようになっていることでしょう！" : "At a high level, Swift is amazing and brings so much to us developers to use on a daily basis. However, there are many little known things in Swift that can save us time and energy if we just take the time to memorize a few key features in Swift. This talk will cover many features in Swift that look weird and translates them in an easy to understand way for beginners and experts alike. After hearing it, developers should hopefully be able to save lots of time decrypting the weird things they may see on a day to day basis!")
    )
    
    static let micheleTitolo = Speaker(
        name: "Michele Titolo",
        twitter: "micheletitolo",
        image: Toucan(image: UIImage(named: "michele")!).maskWithEllipse().image,
        bio: isJapanese ? "Michele Titoloは機械の反乱についてまったく気にしていません。2010よりプロとしてソフトウェア開発を始め、数多くのテスト書かれていないコードを見てきて、未来が安全であるという確信を得ました。 彼女はCapital Oneのリードエンジニアであり、Women Who CodeのCTOでもあります。日夜、彼女は品質が高くメンテナンスしやすいコードを世界に広めるために活動しています。" : "Michele Titolo is not at all worried about a robot uprising. Making software professionally since 2010, she has seen enough codebases without tests to know our future is safe. By day she is a Lead Software Engineer at Capital One and CTO of Women Who Code. By night she travels the world advocating for high quality and maintainable code.",
        presentation: Presentation(
            title: isJapanese ? "プロトコルと約束の地" : "Protocols and the Promised Land",
            summary: isJapanese ?
                "Swiftの設計はジェネリクスや第一級プロトコルなど言語の機能がアプリケーション開発のカギとなることを推進しています。しかし、Objective-Cから導入されたものを含む論理的パターンの多くは期待した通りには動作しません。多くの場合、Swiftの型システムは、プロパティをクラスとプロトコルの両方に拘束したりする素直なパターンとうまく動きません。この講演ではいくつかの課題に着目し、内部に潜む原因を議論し、対応策について考えます。" :
                "Swift’s design promotes language features like generics and first-class protocols as key architectural components in application development. However, many of the logical patterns that arise, including ones imported from Objective-C, don’t work as we expect them to. In many cases, Swift’s type system resists certain straightforward patterns, such as constraining a property to both a class and a protocol. This talk will highlight several of these challenges, discuss the underlying cause, and evaluate workarounds."))
    
    static let rachelBobbins = Speaker(
        name: "Rachel Bobbins",
        twitter: "bobbins",
        image: Toucan(image: UIImage(named: "rachel")!).maskWithEllipse().image,
        bio: isJapanese ? "Stitch FixでiOSのリードエンジニアをしています。以前はPivotal Labsで働いていました。ユーザ・開発者の両方にとって素晴らしい経験を作り出すことを大切にしています。" : "Rachel is a lead engineer on the iOS team at Stitch Fix. Previously, she worked at Pivotal Labs. She cares deeply about building delightful experiences for both software users and software developers.",
        presentation: Presentation(
            title: isJapanese ? "Swift版「誰のためのデザイン？」" : "The Design of Everyday Swift",
            summary: isJapanese ?
                "D.A.ノーマン著「誰のためのデザイン？（原題: \"The Design of Everyday Things\"）」はデザイン哲学に焦点をあてたデザインの書です。そこで紹介されている多くの原則はSwiftのような物理的ではない言語についても当てはまります。このような原則を通して、読みやすく効果的なコードの書き方を探ります。" :
                "Don Norman's \"The Design of Everyday Things\" is a classic design book, focused on the design of physical objects. Many of the principles that he discusses are also applicable to non-physical object–like Swift! In this talk, we'll go over some of these principles, and how they can be applied towards writing well-factored, easy-to-read Swift code."))
    
    static let danielHaight = Speaker(
        name: "Daniel Haight",
        twitter: "daniel1of1",
        image: Toucan(image: UIImage(named: "daniel")!).maskWithEllipse().image,
        bio: isJapanese ? "iOSエンジニアです。そうではないふりをしますが。小さなプロダクトコンサルタント会社を経営しています。タイトなジーンズを着、ゆっくりと旅行の荷造りのエキスパートになっています。" : "Daniel is an iOS Developer, whenever he is not pretending to be one. He runs a small product consultancy - Many Things. He wears tight jeans and he is slowly becoming an expert at travel packing.",
        presentation: Presentation(
            title: isJapanese ? "xcodeless - the build system" : "xcodeless - the build system",
            summary: isJapanese ?
                "xcodebuildが無いとしたらどうしますか？どのようにプロジェクトをビルドするでしょうか？Xcodeがどうやってプロジェクトをビルドするのか、またswiftcとClangを使ってビルドする方法を説明します。" :
                "what would you do without xcodebuild? why would you do it? how would you do it? we'll take a look at how Xcode builds your projects and how we can use swiftc and Clang to build our own."))

    static let stephanieShupe = Speaker(
        name: "Stephanie Shupe",
        twitter: "steph_shupe",
        image: Toucan(image: UIImage(named: "stephanie")!).maskWithEllipse().image,
        bio: isJapanese ? "Lookoutでシニアソフトウェアエンジニアをしており、Women Who Codeのアドバイザーもしています。iOSのフィールドで長年の経験を持っており、最近はバックエンドの開発により関わっています。自身が新しいことを学ぶこと、また、人が学習しスキルアップをサポートすることに情熱を持っています。" : "Stephanie Shupe is a Senior Software Engineer at Lookout and an Advisor to Women Who Code. She has years of experience in iOS and has recently gotten more involved with backend development. Stephanie is passionate about learning new things, and helping others learn and develop their skills.",
        presentation: Presentation(
            title: isJapanese ? "スマートホームのためのコード" : "Code for the Smart Home",
            summary: isJapanese ? "私たちはスマートテクノロジーの時代に生きており、スマートテクノロジーは家庭にも入り始めています。この講演では、Appleが提供しているスマートアクセサリのためのフレームワークであるHomeKitと連携する方法について解説します。この講演を聞いた後、家に帰ってすぐにスマートアクセサリを触りたくなるかもしれませんよ？" : "We live in the age of smart technology and it has started to come into our homes. This presentation will cover how to interact with HomeKit, Apple’s framework for smart accessories. Perhaps after the talk, you’ll go off and play with accessories in your own home!")
    )
    
    static let himiSato = Speaker(
        name: "Himi Sato",
        twitter: "himisanta",
        image: Toucan(image: UIImage(named: "himi")!).maskWithEllipse().image,
        bio: isJapanese ? "大学時代はドイツ語を専攻し、前職は危険物に特化した物流会社で国内輸送を担当していました。危険物乙種四類取扱者や毒物劇物取扱者の資格を持っています。しかしプログラミングに出会い、現在グローバルNPO「Women Who Code Tokyo」の Co-founderをしています。このカンファレンスで沢山の人達とお会いできる事を楽しみにしています。" : "I majored in German Linguistics and literature, worked for a logistics company which specialized in dangerous materials. I have some special licenses. (A hazardous materials engineer etc...) But　luckily I discovered the world of programming. Now I'm a co-founder of Women Who Code Tokyo. I'm looking forward to seeing many people at this conference.",
        presentation: Presentation(
            title: isJapanese ? "Building Women Who Code in Tokyo" : "Building Women Who Code in Tokyo",
            summary: isJapanese ? "約2年間、私はWomen Who Code というコミュニティをここ東京で広げていきました。”Building”とは、コミュニティを形成することであり、コーディングすることであり、また自身のスキルを向上することでもあります。新しくて素敵なSwiftコミュニティを構築する為に、私が学んだ教訓を皆さんと共有できたら嬉しいです。" : "For the past two years, I’ve been building the Women Who Code Community here in Tokyo. Building community, building in code, and building my own skills. I’d like to share lessons I learned as we build the new, awesome Swift community.")
    )
    
    static let novallKhan = Speaker(
        name: "Novall Khan",
        twitter: "novallkhan",
        image: Toucan(image: UIImage(named: "novall")!).maskWithEllipse().image,
        bio: isJapanese ? "SplitwiseでiOSエンジニアをしており、Apple Watch上での割り勘できる機能の開発をしています。SplitwiseのiPhoneアプリに素晴らしい新機能を実装しました。また、HCIの研究者、メンタルヘルス、technology spaceへのコントリビューター、コンピューターが出てくる以前のコンテキストでのコーディングに対する提唱者でもあります。" : "Novall is an iOS engineer at Splitwise where she’s worked on bringing bill-splitting to the Apple Watch, and has built delightful new features for the Splitwise iPhone app. Novall is also an HCI researcher, a contributor to the mental health & technology space, and advocates for writing code in the context of humans before computers.",
        presentation: Presentation(
            title: isJapanese ? "SwiftコンパイラとLLDBの連携" : "Swift compiler integration in LLDB",
            summary: isJapanese ? "デバッグはLLDBとSwiftコンパイラの日々の進歩によってさらに簡単になっています。デバッグコンソールを使った新しいテクニック、Swiftにおけるエラーハンドリング、特定のエラーが発生したところでブレークする方法を学びます。またデータフォーマットの方法の改善、名前付きブレークポイントなどを見ていきます。" : "Everyday debugging becomes even easier with advancements to LLDB and the swift compiler. Learn new tricks with the debugging console, handling errors in Swift expressions, and stopping when specific Swift error types occur. We’ll also explore improved data formatting, named breakpoints, and more!")
    )
    
    static let jpSimard = Speaker(
        name: "JP Simard",
        twitter: "simjp",
        image: Toucan(image: UIImage(named: "jpsimard")!).maskWithEllipse().image,
        bio: isJapanese ? "Realmにて、Objective-CとSwiftのバインディングを担当しています。また、jazzy（Appleがリリースし忘れているドキュメンテーションツール😜）の開発者でありSwiftのツールチェーンのハックを楽しんでいます。" : "JP works at Realm on the Objective-C & Swift bindings, creator of jazzy (the documentation tool Apple forgot to release) and enjoys hacking on Swift tooling.",
        presentation: Presentation(
            title: isJapanese ? "実践的クロスプラットフォームSwift" : "Practical Cross-Platform Swift",
            summary: isJapanese ?
                "SwiftはApple以外のプラットフォームでも利用できるようになりました。iOSアプリ以外でも好きなようにSwiftを書けます。この講演では、CocoaやObjective-Cの機能を犠牲にせずに、クロスプラットフォームでSwiftを用いるときの実践的な書き方、テスト・デバッグ手法、について解説します。" :
                "With Swift now available on non-Apple platforms, you can now set your code free to roam beyond just your iOS app. In this presentation, we'll discover practical ways to write, test, debug and deploy cross-platform Swift code without sacrificing the Cocoa and Objective-C functionality where it's available."))
    
    static let gwendolynWeston = Speaker(
        name: "Gwendolyn Weston",
        twitter: "purpleyay",
        image: Toucan(image: UIImage(named: "gwen")!).maskWithEllipse().image,
        bio: isJapanese ? "PlanGridでエンジニアをしており、建築設計図用のバージョンコントロールの開発をしています。数学と紫色(#A157E8）が好きで、初めてのミュージックアルバムの制作を現在しています。" : "Gwendolyn Weston is a developer at PlanGrid, where she works on version control for construction blueprints. She likes math, the colour purple (#A157E8), and is currently producing her first music album.",
        presentation: Presentation(
            title: isJapanese ? "平常心で型を消し去る" : "Keep Calm and Type Erase On",
            summary: isJapanese ? "型を明確にすることがSwiftらしいやり方であると気づいた時、同時に時には型を消す必要があると分かります。この講演では、型とは何か、型を消すことが何を意味するか、なぜそうしたいかについて解説します。" : "Just when you thought having unambiguous types was the one true way of Swift, it turns out that sometimes it’s necessary to erase types.  This talk answers what a type is, what it means to erase a type, and why you would want to do it."))
    
    static let maximCramer = Speaker(
        name: "Maxim Cramer",
        twitter: "mennenia",
        image: Toucan(image: UIImage(named: "Maxim")!).maskWithEllipse().image,
        bio: isJapanese ? "デザインと開発のバックブランドを持ち、人を観察し、技術が本当に役立つように改善することに情熱を持っています。" : "Coming from both a design and development background, Maxim loves observing people in their natural habitat, making technology that will serve them instead of the other way around.",
        presentation: Presentation(
            title: isJapanese ? "ライブデザイニング:🎙🎨 " : "Live Design:🎙🎨 ",
            summary: isJapanese ? "私たちはコードを書くことが好きです。しかし、App Storeで注目されるためにはコーディングだけでなく、他の素養も必要になります。この講演では、アプリの申請時に必要となるアプリアイコンとスクリーンショットをSketchを使って作成するデモをその場で行います。コーディングからアプリ申請まで、自分一人でうまくやる方法を説明します。" : "We know and love code. But even code requires a bit of help from other disciplines to grab attention in the app store. In this talk, I’ll do a live demonstration in Sketch of making app icons and screenshot collateral for your app’s submission to the store. Learn how to own your app, from code to submission. ")
    )
}
