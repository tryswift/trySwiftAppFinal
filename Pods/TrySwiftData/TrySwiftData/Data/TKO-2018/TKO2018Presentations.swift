//
//  NYC2016Presentations.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let tko2018Presentations: [String : Presentation] = [
    "swift_tour" : {
        let presentation = Presentation()
        presentation.id = 1
        presentation.title = "A Secret Swift Tour"
        presentation.titleJP = "裏 Swift Tour"
        presentation.summary = "When you started learning Swift, maybe you played 'A Swift Tour', the official tutorial from Apple. But as time passed, you started to understand and get used to Swift. Let's play 'A Secret Swift Tour'."
        presentation.summaryJP = "Swift を学び始めるとき、Apple の公式チュートリアル 'A Swift Tour' に取り組んだ方も多いのではないでしょうか。 そして、時を経て、Swift に慣れ親しんだ今だからこそ理解し、得られるものがあります。もう少し深堀りした Swift の世界、'A Swift Tour' の裏面に取り組んでみましょう。"
        presentation.speaker = tko2018Speakers["ezura"]
        return presentation
    }(),
    "sil" : {
        let presentation = Presentation()
        presentation.id = 2
        presentation.title = "SIL for First Time Learners"
        presentation.titleJP = "SIL入門"
        presentation.summary = "Swift compiler runs in multiple phases and one of the biggest one is SIL optimizations. The SIL optimizer performs all the important Swift-specific optimizations, so I believe that it’s quite valuable to have understanding about SIL as Swift developer. In this talk, we’ll go over basic idea of SIL with simple examples."
        presentation.summaryJP = "Swiftのコンパイラは複数のフェーズにわけて実行され、そのうちもっとも大きなものが SILの最適化です。SIL Optimizer はSwift特有のすべての最適化を担うので、SwiftのエンジニアがSILを理解しておくことは極めて重要だと考えます。このトークでは、SILの基礎を簡単な例を用いて説明します。"
        presentation.speaker = tko2018Speakers["kita"]
        return presentation
    }(),
    "clang" : {
        let presentation = Presentation()
        presentation.id = 3
        presentation.title = "Exploring Clang Modules"
        presentation.titleJP = "Clang モジュールの探検"
        presentation.summary = "Swift and Objective-C frameworks share the same underlying module system, based upon Clang Modules. They are intended to replace header files as a way of communicating the interface for a library, but they come with their own set of edge cases. We will examine how Clang modules are able to replace `#import` statements, some of the consequences of using modules, and how the design of Clang modules has influenced Swift's library story."
        presentation.summaryJP = "Swift や Objective-C のフレームワークは Clang モジュールをベースとした同じモジュールシステムを共有しています。ライブラリのインターフェースとやりとりすることでヘッダファイルを置き換えますが、それぞれにエッジケースが存在します。Clang モジュールの `#import` 文の置き換え方、モジュールを使うことによる影響、Clagnモジュールの設計がSwiftのライブラリにどう影響してきたかを調べてみます。"
        presentation.speaker = tko2018Speakers["segiddins"]
        return presentation
    }(),
    "responder_chain" : {
        let presentation = Presentation()
        presentation.id = 4
        presentation.title = "Getting to Know the Responder Chain"
        presentation.titleJP = "レスポンダチェーンを知ろう"
        presentation.summary = "I'll provide an explanation about how the Responder Chain pattern works, how it exists in Apple's frameworks, and give some examples of how to take advantage of it."
        presentation.summaryJP = "レスポンダチェーンパターンの仕組み、Apple のフレームワークの仕組み、そしてその活用方法の例を紹介します。"
        presentation.speaker = tko2018Speakers["samuelgoodwin"]
        return presentation
    }(),
    "simplicity" : {
        let presentation = Presentation()
        presentation.id = 5
        presentation.title = "Optimizing Swift code for separation of concerns and simplicity"
        presentation.titleJP = "関心の分離と単純化のためのSwiftコードの最適化"
        presentation.summary = "Separating concerns in code is often seen as a premature optimization when code doesn’t need to be reused, but it has huge implications in our ability to comprehend what code does. Let’s explore examples of this in Swift in what I like to call 'separating what code does from how it does what it does'."
        presentation.summaryJP = "関心の分離は、コードが再利用されないときには時期尚早な最適化とみなされることがよくありますが、我々がコードが何をしているのかを理解することに対しては大きく影響します。Swiftにおけるこの実例を紹介します。"
        presentation.speaker = tko2018Speakers["javi"]
        return presentation
    }(),
    "coders-design" : {
        let presentation = Presentation()
        presentation.id = 6
        presentation.title = "Should coders design?"
        presentation.titleJP = "コーダーがデザインすべきなのか"
        presentation.summary = "Almost all software engineers unanimously agree that the world where designers code is a better world. In this talk I'd like to explore the opposite idea. I'd like to explore how being aware of core design principals will save you time, make your products more resilient to the real-life challenges, improve your communication with users, and help to make smarter, more delightful products."
        presentation.summaryJP = "ほとんどのソフトウェアエンジニアは、デザイナーがコーディングする世界がより良い世界であることに同意します。 このトークでは、反対の考えを探求したいと思います。 コアデザインの原則を知っていることによって、時間を節約し、よりプロダクトに実用的な課題に対する弾力性を持たせ、ユーザーとのコミュニケーションを改善し、スマートで楽しいプロダクトを作るのに役立つということを探究したいと思います。"
        presentation.speaker = tko2018Speakers["sash"]
        return presentation
    }(),
    "icloud" : {
        let presentation = Presentation()
        presentation.id = 7
        presentation.title = "Event driven networking for Swift"
        presentation.titleJP = "Event driven networking for Swift"
        presentation.summary = "Everyone knows that Swift is the language of choice for building apps for iPhone, iPad, Mac, Apple Watch and Apple TV. Over the last couple of years, Swift has also emerged as a great language for developing server applications that run on Linux. Today, most high-scale environments run by companies like Apple, Facebook, Google, Netflix and Twitter use performance-optimized networking frameworks built in Java, C++ and other languages.  This talk will cover how the server infrastructure teams at Apple are using Swift in their development, leveraging years of experience writing high-performance, highly-scalable network applications."
        presentation.summaryJP = "Swift が iPhone, iPad, Mac, Apple Watch そして Apple TV のアプリを開発する言語として選ばれていることはみなさんご存知でしょう。この数年、Swift は Linux で動作するサーバーサイドアプリケーションを開発するのにも優れた言語としても浮上してきました。現在、Apple, Facebook, Google, Netflix, Twitter などの企業が運用する大規模な環境では、Java、C ++などの言語による、パフォーマンスに最適化されたネットワークフレームワークが使われています。このトークでは、Apple のサーバーインフラストラクチャーチームが長年の経験を活かし、どのように高性能でスケーラビリティの高いネットワークアプリケーションを作成して、どのように開発時にSwiftを利用しているかについて説明します。"
        presentation.speaker = tko2018Speakers["norman"]
        return presentation
    }(),
    "diamond" : {
        let presentation = Presentation()
        presentation.id = 8
        presentation.title = "The diamond of variance"
        presentation.titleJP = "変性のダイヤモンド"
        presentation.summary = "Generics is always a confusing yet interesting topic in Swift language. Generics Manifesto did a great explanation on how Swift's type system is built for practicality more than principle. But if we look at the theory of 'diamond of variance', we can have another point of view about the completeness of a type system and how Swift generics fit in with the theory. This talk will explain what really is Variance, Covariance, Contravariance in Swift as well as the last amazing piece of above diamond: The Phantom Type."
        presentation.summaryJP = "ジェネリクスはSwift言語における悩みの種となっている面白いトピックです。Generics Manifest では、Swift の型システムが定義よりも実践に重きを置いて作られたかについて素晴らしい説明がされています。ですが、「変性のダイヤモンド」という理論では、型システムの完全性とSwiftのジェネリクスがいかにこの理論にフィットしているかを別の視点で見ることができます。 このトークでは、Swiftにおける変性、共変性、反変性と、ダイヤモンドの上に輝く、Phantom Type について説明します。"
        presentation.speaker = tko2018Speakers["orakaro"]
        return presentation
    }(),
    "swiftypi" : {
        let presentation = Presentation()
        presentation.id = 9
        presentation.title = "SwiftyPi"
        presentation.titleJP = "SwiftyPi"
        presentation.summary = "From mobile development to server-side applications, we are starting to see how flexible the Swift language can be. But there are more frontiers to explore, that unlock new possibilities for Swift developers. In this session, Kate will show you the Good, the Bad and the Ugly of how to set up your Swift Environment in order to develop on a Raspberry Pi."
        presentation.summaryJP = "モバイル開発からサーバーサイドアプリケーションまで、我々はSwift 言語に柔軟性を見出だし始めています。ですがまだSwiftには開拓されていない領域があり、Swiftエンジニアがその可能性を切り開くかもしれません。このトークでは、Kate が Raspberry Pi で Swift の開発環境を構築するにあたって良かったこと、悪かったことについてお話します。"
        presentation.speaker = tko2018Speakers["kate"]
        return presentation
    }(),
    "home" : {
        let presentation = Presentation()
        presentation.id = 10
        presentation.title = "Swift in my home"
        presentation.titleJP = "我が家を支えるSwiftの技術"
        presentation.summary = "Swift is an indispensable technology for communication in our home. Various things are made utilizing Swift such as iOS client applications for childcare, Web server which receives the request, SlackBot, regularly executed tasks for my chores, and so on. I would like to introduce some selected use-cases among countless possibilities."
        presentation.summaryJP = "Swiftは我が家庭内のコミュニケーションには欠かせない技術となっています。育児用のiOSクライアントアプリ、そのリクエストを受け取るWebサーバー、ちょっと便利なSlackBot、妻が喜ぶ定期実行タスクなどなど、いろんなものがSwiftによって作られ活用されています。数え切れないほどある中で厳選した幾つかを紹介したいと思います。"
        presentation.speaker = tko2018Speakers["yukiasai"]
        return presentation
    }(),
    "ui-testing" : {
        let presentation = Presentation()
        presentation.id = 11
        presentation.title = "UI Testing for Fun and Profit"
        presentation.titleJP = "UI Test の楽しさとメリット"
        presentation.summary = "Many iOS developers are well-versed in unit testing their applications, but haven't started taking advantage of UI testing within Xcode. Follow me on my journey of implementing UI testing in my app, where I'll share my highlights and struggles of testing all the things."
        presentation.summaryJP = "多くのiOS開発者はユニットテストには精通していますが、Xcodeを使ったUIテストを行なっていない方が多いと思います。自分のアプリに UI テストを導入した際のハイライトと、すべてをテストすることの苦労を共有します。"
        presentation.speaker = tko2018Speakers["saraheolson"]
        return presentation
    }(),
    "blockchain" : {
        let presentation = Presentation()
        presentation.id = 12
        presentation.title = "Writing Blockchain Clients in Swift"
        presentation.titleJP = "ブロックチェーンのクライアントをSwiftで実装する"
        presentation.summary = "An introduction to writing decentralized apps in Swift."
        presentation.summaryJP = "Swiftにおける分散アプリケーションの作成について紹介します。"
        presentation.speaker = tko2018Speakers["tamar"]
        return presentation
    }(),
    "webapi" : {
        let presentation = Presentation()
        presentation.id = 13
        presentation.title = "Protocol Oriented WebAPI Abstraction"
        presentation.titleJP = "Protocol Oriented WebAPI Abstraction"
        presentation.summary = "Most applications interact with the server via the Web API. I'd like to show you how to define protocol-oriented API to appropriately design API communication as the foundation of the application and make it easier to repair or change libraries that will be needed in the future. I will also introduce you to the design of a type-safe API abstraction layer combined with RxSwift. I will also show you my AbstractionKit framework."
        presentation.summaryJP = "今やスタンドアロンで動くiOSアプリは数少なく、ほとんどのアプリではWebAPIを経由してサーバーと情報のやり取りを行います。アプリの動作の根幹となるAPI通信を適切に設計し、将来の改修や通信/マッピングライブラリの入れ替えなどをより容易にするためのプロトコル指向なAPI定義の仕方と、さらにそれとRxSwiftを組み合わせた型安全なAPI抽象レイヤーの設計について紹介します。また、ここで話す内容をフレームワーク化したAbstractionKitの紹介をします。"
        presentation.speaker = tko2018Speakers["hiragram"]
        return presentation
    }(),
    "game" : {
        let presentation = Presentation()
        presentation.id = 14
        presentation.title = "👾"
        presentation.titleJP = "👾"
        presentation.summary = "Many indie game developers never use Swift for making their games. Let's develop mobile games in Swift. This session introduces how to develop casual games in Swift using SpriteKit / Game Algorithm / Tools. Become an indie game developer!"
        presentation.summaryJP = "インディーズゲームの開発者の多くは、開発にSwiftを使ったことがありません。Swiftでモバイルゲームを作ってみましょう。このトークでは、Swiftでカジュアルゲームを作る方法を紹介します。SpriteKitやゲームのアルゴリズム、ツールについてもお話します。インディーズゲームの開発者になりましょう！"
        presentation.speaker = tko2018Speakers["giginet"]
        return presentation
    }(),
    "ast" : {
        let presentation = Presentation()
        presentation.id = 15
        presentation.title = "AST Meta-programming"
        presentation.titleJP = "AST メタプログラミング"
        presentation.summary = "Swift has few  dynamic behavior at run time. I will explore ways to achieve code injection and aspect oriented programming using AST."
        presentation.summaryJP = "Swift にはランタイムにおける動的な振る舞いがほとんどありません。コード注入の実現方法や、AST を用いたアスペクト指向プログラミングについてお話します。"
        presentation.speaker = tko2018Speakers["katsumi"]
        return presentation
    }(),
    "proofs" : {
        let presentation = Presentation()
        presentation.id = 16
        presentation.title = "Finally Solving the Expression Problem"
        presentation.titleJP = "Expression Problem を解決する"
        presentation.summary = "UIKit lets us describe view hierarchies by putting together a bunch of UIView and UIView subclasses. We can even create our own views by subclassing UIView ourselves without even reaching into UIKit! But we can't reuse this view description on AppKit or for serialization. Imagine for a moment, we had EnumKit, it's like UIKit, but the views are provided as cases of an enum. Now we can reuse the view description, but we can no longer create our own views without reaching into EnumKit (or forking the library). The 'Final Tagless' approach gives us the best of both worlds taking advantage of Swift’s powerful Self type inside protocols. "
        presentation.summaryJP = "UIKitでは、一連の UIView と UIView のサブクラスをまとめてビュー階層を記述します。UIViewをサブクラス化することによって自分自身のビューを作成することもできます。しかし、この View Description をAppKitやシリアライゼーションに再利用することはできません。UIKit と似たようなものに EnumKit があり、 View は列挙型のケースとして提供されています。これで View Description を使いまわすことができますが、EnumKit なしで (もしくはライブラリをフォークしないと）ビューを生成することができません。'Final Tagless' は、Swift のプロトコルの内部にある強力な Self 型を用いて、双方の世界をベストな状態にします。"
        presentation.speaker = tko2018Speakers["bkase"]
        return presentation
    }(),
    "peerlabs" : {
        let presentation = Presentation()
        presentation.id = 17
        presentation.title = "Swift Peer Lab Barcelona"
        presentation.titleJP = "Swift もくもく会 in Barcelona"
        presentation.summary = "I want to share my experience of creating a Swift Peer Lab in the city of Barcelona. I will start by explaining the peer lab concept. Then I will share why I believe it’s an easy and rewarding experience and how you can do it in your city. I will also share some numbers and tips from my experience. "
        presentation.summaryJP = "バルセロナで開催した Swift Peer Lab の体験についてお話します。コンセプトから説明し、これがあなたの街でもでき、簡単で価値ある体験が得られると思っている理由を説明します。いくつかのTipsについてもお話します。"
        presentation.speaker = tko2018Speakers["tiago"]
        return presentation
    }(),
    "visualize-algorithms" : {
        let presentation = Presentation()
        presentation.id = 18
        presentation.title = "Using Swift to Visualize Algorithms"
        presentation.titleJP = "Swift によるアルゴリズムの可視化"
        presentation.summary = "Visual aids can help make clear how an algorithm functions. In this talk we will examine how UIBezierPath works, by reimplementing the algorithm in an interactive way that we can see. Using Swift playgrounds, we can quickly get feedback about our implementation and use it as a learning tool."
        presentation.summaryJP = "視覚教材は、アルゴリズムがどのように機能するかを明確にするのに役立ちます。 このトークでは、UIBezierPathがどのように動作するかを、我々が見ることができるインタラクティブな方法で、アルゴリズムを再実装して調べてみます。 Swift Playgroundを使って、実装のフィードバックをすばやく入手し、学習ツールとして使用することができます。"
        presentation.speaker = tko2018Speakers["ben"]
        return presentation
    }(),
    "kitura" : {
        let presentation = Presentation()
        presentation.id = 19
        presentation.title = "Codable Routing with Kitura"
        presentation.titleJP = "Kitura で Codable ルーティング"
        presentation.summary = "Swift 4 introduced the Codable interface that, through JSONEncoder and JSONDecoder, makes working with JSON a really pleasurable experience. Encoding and decoding JSON often becomes the most complex part of working with RESTful APIs. Using Codable, Kitura 2.0 offers to take up the responsibility of JSON processing, allowing you to work directly with your own Codable types, in a type-safe manner. Using KituraKit, you may also share type definitions between the iOS app and the server side."
        presentation.summaryJP = "Swift 4では、Codable が導入されました。これは、JSONEncoder や JSONDecoder を通して、JSON を扱いやすくしてくれるものです。 JSONのエンコードやデコードが、RESTful API を扱う際の一番複雑な部分です。Codable を使うことで、 Kitura 2.0 は JSON の処理の責務を受け持ち、型安全な方法で、独自の Codable 型で直接処理できます。KituraKit を用いることで、iOS アプリとサーバーサイドの間で型の定義を共有することができるでしょう"
        presentation.speaker = tko2018Speakers["pushkar"]
        return presentation
    }(),
    "coreml" : {
        let presentation = Presentation()
        presentation.id = 20
        presentation.title = "Super Resolution with CoreML"
        presentation.titleJP = "超解像+CoreML+Swiftを使ってアプリの画像データ転送量削減に挑戦する"
        presentation.summary = "The 'super resolution' technique is used for converting low resolution image into high resolution, which reduces the amount of image data that needs to be transfered. In this talk, I'd like to show you the implementation of super resolution with CoreML and Swift, and compare the results with conventional methods."
        presentation.summaryJP = "「超解像」は低解像度画像を高解像度に変換する技術のことです。この技術をiOSアプリに適用することで、画像データの転送量削減が期待できます。本トークではCoreMLとSwiftを使って超解像処理を実装し、従来手法と比較・検証した結果についてご報告します。"
        presentation.speaker = tko2018Speakers["kenmaz"]
        return presentation
    }(),
    "charles" : {
        let presentation = Presentation()
        presentation.id = 21
        presentation.title = "Introducing Charles for iOS"
        presentation.titleJP = "iOSでCharlesを導入する"
        presentation.summary = "Many of the apps we develop access APIs over the internet. Charles Proxy running on macOS lets you capture the HTTP and HTTPS traffic from iOS, so you can debug faults and measure performance. At try! Swift Tokyo, Karl–the creator of Charles Proxy–will unveil a new and more powerful approach: Charles for iOS; enabling you to capture traffic directly on your iOS device."
        presentation.summaryJP = "我々が開発するアプリの多くが、インターネット経由でAPIにアクセスします。macOS上で実行されるCharles Proxyは、iOSからの HTTP と HTTPS のトラフィックをキャプチャできるため、障害をデバッグしたり、パフォーマンスを測定することができます。try!Swift Tokyoでは、Charles Proxy の作者である Karl が Charles for iOS という新しく強力なアプローチを発表します。これにより、あなたのiOSデバイスでトラフィックを直接キャプチャすることが可能となります。"
        presentation.speaker = tko2018Speakers["karl"]
        return presentation
    }(),
    "ar" : {
        let presentation = Presentation()
        presentation.id = 22
        presentation.title = "Designing Experiences With Augmented Reality"
        presentation.titleJP = "拡張現実における体験設計"
        presentation.summary = "As technology becomes more ubiquitous with the real world, it is inevitable that experiences will go beyond screens and in physical space. Like VR and Voice, Augmented Reality (AR) is one of the emerging technologies experiencing an undiscovered phase, similar to mobile applications just a decade ago. David Hoang shares his experiences designing for AR. This talk will cover the best practices of what makes a great AR experience, how to prototype physically, and share a few concepts using Apple’s ARKit."
        presentation.summaryJP = "技術が現実世界でよりユビキタスになっていくにつれて、経験がスクリーンや物理空間からはみ出てくるのは避けられません。VRや声のように、また10年前モバイルアプリケーションがそうだったように、拡張現実 (AR) は未知の段階にいる新しい技術です。David Hoangは、ARの設計で経験したことをお話します。このトークでは、優れたAR体験を実現するためのベストプラクティス、物理的なプロトタイプ作成方法、AppleのARKitを使ったコンセプトを紹介します。"
        presentation.speaker = tko2018Speakers["david"]
        return presentation
    }(),
    "kotlin" : {
        let presentation = Presentation()
        presentation.id = 23
        presentation.title = "Kotlin For Swift Developers"
        presentation.titleJP = "Swift エンジニアのための Kotlin 入門"
        presentation.summary = "Kotlin is a functional language written on top of the JVM that your Android friends are probably *really* excited about. It's got quite a bit in common with Swift, and learning to read it can help you communicate more easily with your Android team.  You'll get a look at this new language from a Swift perspective - what things are the same, what things are not, and what things each language's partisans can be jealous of in the other."
        presentation.summaryJP = "Kotlin は JVM に書かれた関数型言語です。あなたのAndroid開発者の友達は、この言語の登場をとても喜んでいることでしょう。Swiftとの共通点が多いこの言語を学ぶことで、Android チームのメンバーとコミュニケーションが取りやすくなります。Swiftの視点からこの言語を眺め、何が同じで何が違うのか、他の言語を書いている人が羨ましがるのはどの辺なのかを見てみましょう。"
        presentation.speaker = tko2018Speakers["ellen"]
        return presentation
    }(),
    "swift5" : {
        let presentation = Presentation()
        presentation.id = 24
        presentation.title = "Preparing for Swift 5 Ownership"
        presentation.titleJP = "Swift5のOwnershipに備える"
        presentation.summary = "Ownership is a new Swift 5 feature that will appear later this year. Although it is important for ABI stabilization, mastering Ownership can help reduce memory copies and improve program performance. In this session, Toru Kuriyama will outline Ownership based on the contents of the Ownership Manifesto released last year."
        presentation.summaryJP = "Ownership(所有権)は今年後半に登場予定のSwift5で追加される機能です。ABI安定化に向けても重要な機能ですが、Ownershipを使いこなすことでメモリコピーを減らすことができ、プログラムのパフォーマンスを向上させることができると期待されます。本セッションでは、昨年公開されたマニフェスト(OwnershipManifesto)に記載された内容を元に、Ownershipの概要をご紹介します。"
        presentation.speaker = tko2018Speakers["kotetu"]
        return presentation
    }(),
    "signal-processing" : {
        let presentation = Presentation()
        presentation.id = 25
        presentation.title = "Digital Signal Processing with Swift"
        presentation.titleJP = "デジタル信号処理 in Swift"
        presentation.summary = "A deep dive into the field of digital signal processing and how Apple’s Accelerate framework makes use of Fast Fourier Transforms for detecting audio frequencies. Join me and see how we can use a powerful language like Swift to break down audio sampling rates with an interactive live demo."
        presentation.summaryJP = "デジタル信号処理の分野に潜って、Apple の Accelerate framework が高速フーリエ変換を使ってどうやってオーディオ周波数を特定しているのかを見てみましょう。Swift のような強力な言語でオーディオサンプリングレートを分解する方法を対話的なデモを通して見てみましょう。"
        presentation.speaker = tko2018Speakers["daisy"]
        return presentation
    }(),
    "codable" : {
        let presentation = Presentation()
        presentation.id = 26
        presentation.title = "The Type-Safe World of Codable"
        presentation.titleJP = "Codableが導く型安全な世界"
        presentation.summary = "You might be surprised to learn that Codable can be used for various situation beyond just mapping API responses, including making source code more type safe. In this talk, Tatsuya Tanaka will introduce you to this more powerful way of using Codable."
        presentation.summaryJP = "CodableはAPIのレスポンスをマッピングするためだけの機能ではありません。Codableは様々な場面で利用でき、ソースコードを型安全にすることができます。このLTではCodableをフル活用するためのアプローチや、よりアグレッシブなCodableの活用方法をご紹介します。"
        presentation.speaker = tko2018Speakers["tattn"]
        return presentation
    }(),
    "conversational-interfaces" : {
        let presentation = Presentation()
        presentation.id = 27
        presentation.title = "Creating conversational interfaces in iOS/Swift"
        presentation.titleJP = "iOS / Swift における対話型インターフェースの作成"
        presentation.summary = "We'll explore the latest technologies for creating conversational interfaces in your app. We'll explore speech recognition, both with Apple's APIs and other solutions such as Amazon Lex. We'll also explore different strategies for voice playback. Lastly, we'll talk about best design practices when building conversational interfaces in your apps."
        presentation.summaryJP = "アプリで対話型インターフェースを実現するための最新技術を紹介します。AppleのAPIとAmazon Lexのような他社の技術による音声認識を見てみましょう。また、音声再生における別なストラテジーについても紹介します。さらに、アプリで対話型インターフェースを構築するにあたってのベストプラクティスについてもお話します。"
        presentation.speaker = tko2018Speakers["wendy"]
        return presentation
    }(),
    "uiimageview-metal" : {
        let presentation = Presentation()
        presentation.id = 28
        presentation.title = "UIImageView vs Metal"
        presentation.titleJP = "UIImageView vs Metal"
        presentation.summary = "Metal is an API that provides access to the GPU. Apple announced it's 10x times faster than OpenGL. In this session, I'll explain the basics of Metal, then compare the performance of graphics rendering with UIImageView. Even if you don't use the API directly, your app is implicitly benefitting from Metal. This comparison to a familiar class will lead you to be conscious of the GPU layer that we usually miss."
        presentation.summaryJP = "MetalはGPUへのアクセスを提供するAPIで、OpenGLより10倍速いという謳い文句で登場しました。本セッションではMetalの基礎を解説しつつ、そのグラフィックス描画性能をUIImageViewと比較してみます。MetalのAPIを直接利用する機会がなくても、Metalはあなたのアプリの裏で暗躍しています。身近なクラスとの比較を通じて、普段我々が意識することのないGPUのレイヤで何が起きているのか、目を向けてみるきっかけになればと思います。"
        presentation.speaker = tko2018Speakers["shu"]
        return presentation
    }(),
    "docker" : {
        let presentation = Presentation()
        presentation.id = 29
        presentation.title = "Best Docker Container in Swift"
        presentation.titleJP = "Swiftが動くDockerコンテナの各OSの性能比較"
        presentation.summary = "Several years have passed since Swift was released as open source and Linux became supported. The adoption of server side Swift has increased. Meanwhile, Swift is constantly being updated, and the cost of supporting different Swift versions on multiple machines is getting higher. By using Docker, this cost can be reduced by preparing a virtual environment container with a fixed Swift version, so we can develop without relying on version. Also, since Docker does not perform full virtualization, disk usage is small, and virtual environment initialization and startup are fast. In this talk, I'll explore the best Docker container for Swift."
        presentation.summaryJP = "Swiftがオープンソースとして公開されてLinuxサポートがされてから数年経ち、サーバーサイドSwiftの導入・運用事例が増えてきました。その間にもSwiftはアップデートされ続けていて、Swiftのバージョンを複数の開発・運用マシンで揃えることのコストが高くなってきています。このコストを削減するためにDockerを用いると、Swiftのバージョンを固定したコンテナ型の仮想化環境を用意できるので、マシンのローカルのSwiftのバージョン依存することなく開発することができます。また、Dockerは完全仮想化を行うわけではないのでディスク使用量は少なく、仮想環境の作成や起動は速いという特徴があります。このトークではSwiftに最適なDockerコンテナを紹介します。"
        presentation.speaker = tko2018Speakers["ihara"]
        return presentation
    }(),
    "typeerasure" : {
        let presentation = Presentation()
        presentation.id = 30
        presentation.title = "The Type Erasure Advantage"
        presentation.titleJP = "型とパフォーマンスで見るType-erasureの利点"
        presentation.summary = "Type erasure, which was presented at try! Swift Tokyo 2016, is now known by many Swift developers. This talk will focus on the type and performance advantages of adopting type erasure. We will also cover the AnySequence implementation in stdlib to explore an efficient and powerful type erasure implementation."
        presentation.summaryJP = "2016年のtry! Swiftで紹介されてから誰もが知るところとなったType-erasure、これを採用するメリットを型とパフォーマンスの面から紐解きます。また、stdlibのAnySequenceの実装をヒントに、効率が良くパワフルなType-erasureの実装を探っていきましょう。"
        presentation.speaker = tko2018Speakers["tarunon"]
        return presentation
    }(),
    "tools" : {
        let presentation = Presentation()
        presentation.id = 31
        presentation.title = "Investing time into developer tools and experience"
        presentation.titleJP = "開発者ツールと経験への時間投資"
        presentation.summary = "How to look for ideas to improve developer tooling and experience. We’ll look at examples of common pain points in daily development and techniques that can be used to improve them, either through creating new developer tools or adjusting the development process. If the 10x developer exists, it's the person that decides to work on things that make the lives of the other 10 developers better."
        presentation.summaryJP = "開発者のツールと経験を向上させるためのアイディアを探すにはどうすればよいでしょうか？新しい開発ツールを作成するか、開発プロセスを調整することで、日々の開発における共通の苦しみとその改善方法を見ていきます。 10倍の開発者がいるなら、その人は他の10人の開発者の生活をより良くするものに取り組むことを決めた人です。"
        presentation.speaker = tko2018Speakers["merowing"]
        return presentation
    }(),
    
    // Workshops
    "kitura-workshop" : {
        let presentation = Presentation()
        presentation.id = 32
        presentation.title = "Building real-world server-side Swift applications with Kitura"
        presentation.titleJP = "使える！Kituraを使ってサーバーサイドSwiftアプリを作ろう！"
        presentation.summary = "You can now build powerful server-side applications in your favorite language, Swift. In this workshop Taiji will take you through what you need to consider when building a back-end service for your iOS apps. This will be followed by you building a real-world server-side application using Kitura that will interface with a client-side application. You’ll learn what an API is, how to install, create and deploy a template Kitura application, how to build upon that template, what codable routing is and how to use it, and, finally, show you how to bring the whole story together in a demo application you can take-away and show your peers!"
        presentation.summaryJP = "みなさんの大好きなプログラミング言語Swiftで、強力なサーバーサイドアプリが作れます。 このワークショップでは、IBM Developer AdvocateのTaijiがiOSアプリのバックエンドサービスを作る際に何が必要かを説明します。さらに、Kituraを使用してクライアント側のアプリケーションとインターフェイスするサーバーサイドアプリを構築します。APIの使い方、インストール方法、Kituraアプリのテンプレートの作り方とそのデプロイ方法、コーディング可能なルーティングの使い方、そして全体的なストーリーをデモアプリと 共にお見せします！"
        presentation.speaker = tko2018Speakers["taiji"]
        return presentation
    }(),
    "firebase-workshop" : {
        let presentation = Presentation()
        presentation.id = 33
        presentation.title = "Cloud Firestore Workshop"
        presentation.titleJP = "Cloud Firestore Workshop"
        presentation.summary = "Cloud Firestore is the next-generation document-object database in the cloud from Firebase. In this workshop, we'll help you understand all of the features of Cloud Firestore, and how to best use it in developing production ready scalable apps. This workshop will provide you with a general introduction to NoSQL databases, and then will cover more advanced topics like querying, transactions, security rules, offline support, pagination, and more!"
        presentation.summaryJP = "Cloud Firestore は Firebase のクラウド上にある次世代のドキュメントオブジェクトデータベースです。 このワークショップでは、Cloud Firestore のすべての機能を理解したり、実用段階でスケーラブルなアプリケーションを開発する際に、その機能を最大限に活用する方法を理解するためのお手伝いをします。NoSQL データベースの概要を紹介し、クエリ、トランザクション、セキュリティルール、オフラインサポート、ページネーションなど、より高度なトピックについて説明します。"
        presentation.speaker = tko2018Speakers["todd"]
        return presentation
    }(),
    "open-source-workshop" : {
        let presentation = Presentation()
        presentation.id = 34
        presentation.title = "Open Source Swift"
        presentation.titleJP = "Open Source Swift"
        presentation.summary = "In this workshop we will look at the Swift compilation process and what those parts are, learn a bit about LLVM, how to find a bug to work on using bugs.swift.org and then making a build with our changes and running tests. A merged pull request is not the goal of this workshop, but after attending this workshop you should have enough knowledge to get started and know where to look to learn more. If you are proficient in C++ or even have some experience with LLVM, then you can start working with the Swift compiler right away. If you do not have former C++ knowledge fear not, the Swift standard library is written mostly in Swift and the python / swift hybrid '.gyb' files."
        presentation.summaryJP = "このワークショップでは、Swift のコンパイルプロセスとその構成要素について説明し、LLVMに ついて少し学び、bugs.swift.org から取り組むバグを見つけ、変更を加えてテストを実行する方法を学びます。プルリクエストがマージされることはこのワークショップの目標ではありませんが、このワークショップに参加した後は、すぐに始められるだけの十分な知識を身につけ、より学ぶために見るべき場所がわかっていることでしょう。C++ に習熟していたり、LLVMの経験があるなら、すぐに Swift コンパイラを使い始めることができます。 C++ の経験がなくても、Swift の標準ライブラリは主に Swift で書かれていたり、python と Swift のハイブリッドである '.gyb' ファイルで構成されています。"
        presentation.speaker = tko2018Speakers["opensource"]
        return presentation
    }(),
    "swift-quest-workshop" : {
        let presentation = Presentation()
        presentation.id = 35
        presentation.title = "Mastering Value Types in Swift with SWIFT QUEST"
        presentation.titleJP = "Swiftの値型を極める powered by SWIFT QUEST"
        presentation.summary = "Swift is a value-type centered language and training is necessary to write code that makes best use of value types. In this workshop, you will learn how to: Create mutable class-centered code that is common in Objective-C and Java, Correct to immutable class-centered code to avoid problems, Correct to value-type-centered code while working with immutable classes. Abstract explanations and artificial examples are often used when learning the concept of programming, but it is difficult to understand how to use it in actual development. By using RPG as a theme, we will aim to understand how to effectively apply the learnings to real programming and other problems."
        presentation.summaryJP = "Swift は値型中心の言語ですが、それを使いこなすにはトレーニングが必要です。本ワークショップでは RPG の戦闘シーンという具体的なプログラムを実装しながら、次の手順で値型の使い方を身に付けていただくことができます。Objective-C や Java で多いミュータブルクラス中心のコードで RPG の戦闘シーンを実装,>ミュータブルクラスの問題を解決するためにイミュータブルクラス中心のコードに修正,イミュータブルクラスと値型の対応関係に基づき、より簡単に実装できる値型中心のコードに修正。プログラミングの概念を学ぶときには抽象的な説明や人工的な例が用いられることが多いですが、実際の開発における使い方を理解するのはなかなか難しいです。 RPG を題材にすることで、現実のプログラミングに即してそれがどのように役立つのかを理解し、他の問題でも効果的に応用できるようになっていただくことを目指します。"
        presentation.speaker = tko2018Speakers["koher"]
        return presentation
    }(),
    "ar-workshop" : {
        let presentation = Presentation()
        presentation.id = 36
        presentation.title = "Augmented Reality, Swiftly!"
        presentation.titleJP = "AR をSwiftyに！"
        presentation.summary = "Join members of Facebook's AR Studio team for an overview of the challenges of creating a large-scale macOS app that mixes Swift, Objective-C(++) and C++. Use Swift to build your own AR experience!"
        presentation.summaryJP = "Facebook の AR Studio チームと一緒に、Swift, Objective-C(++), C++ が混ざった大規模な macOS アプリに挑戦してみましょう。Swift を使ってあなたの AR 体験を作ります。"
        presentation.speaker = tko2018Speakers["fb"]
        return presentation
    }(),
    "realm-workshop" : {
        let presentation = Presentation()
        presentation.id = 37
        presentation.title = "Making Apps with Realm Cloud"
        presentation.titleJP = "Realm Cloudを使ってアプリを作ろう"
        presentation.summary = "By using Realm Cloud, which can be used Realm Platform easily, we'd like to make app interact with server-side, without developing APIs."
        presentation.summaryJP = "Realm Platformを簡単に利用できるRealm Cloudを使って、APIを開発することなくサーバーサイドと連携するアプリを作ります。"
        presentation.speaker = tko2018Speakers["katsumi"]
        return presentation
    }(),
    "peerlabs-tokyo" : {
        let presentation = Presentation()
        presentation.id = 38
        presentation.title = "Peer Labs"
        presentation.titleJP = "ピアラボ (もくもく会)"
        presentation.summary = "Peer Labs is your chance to get hands on with things you learned from try! Swift presentations, discuss any issues with the speakers, connect with your peers, work on open source projects, organize impromptu learning sessions and more! Peer labs do not have a strict structure, and are open-ended instead. It is what you and your peers make of it! We will ask everyone to introduce themselves in the beginning, and then it is up to you to ask questions and work together with others on projects that interest you."
        presentation.summaryJP = "ピアラボ（もくもく会）はtry! Swift のプレゼンテーションから学んだことやスピーカーと議論した問題に取り組む場所です。他の人と仲良くなったり、オープンソースプロジェクトに取り組んだり、即興でLTをはじめたりなどの絶好の機会です！ピアラボには決まった形はなく、オープンです。同じ会場にいる仲間と一緒に作り上げていきます。最初にお互いに自己紹介をしてから、質問しあったり、興味のあるプロジェクトに一緒に取り組んだりしてみましょう。"
        presentation.speaker = tko2018Speakers["peers"]
        return presentation
    }()
]
