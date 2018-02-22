//
//  NYC2016Speakers.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let tko2018Speakers: [String : Speaker] = [
    "norman" : { let speaker = Speaker()
        speaker.id = 1
        speaker.name = "Norman Maurer"
        speaker.twitter = "normanmaurer"
        speaker.imageAssetName = "norman.jpg"
        speaker.bio = "Norman Maurer is a software engineer on the iCloud team at Apple.  He works on the asynchronous network frameworks that underly many of Apple's services."
        speaker.bioJP = "Norman Maurer は Apple の iCloud チームのソフトウェアエンジニアです。 Apple の多くのサービスの根底にある非同期ネットワークのフレームワークに取り組んでいます。"
        return speaker
    }(),
    "merowing" : { let speaker = Speaker()
        speaker.id = 2
        speaker.name = "Krzysztof Zabłocki"
        speaker.twitter = "merowing_"
        speaker.imageAssetName = "krzysztof.jpg"
        speaker.bio = "Krzysztof is the Lead iOS developer at The New York Times, known for creating Sourcery, Objective-C Playgrounds, and Apple’s Essential Apps like Foldify and 3D Game Engines. Passionate about writing quality code and helping other do the same. He blogs on merowing.info and open sources tools/libraries on github.com/krzysztofzablocki."
        speaker.bioJP = "KrzysztofはNew York TimesのリードiOS>エンジニアで、 Sourceryや Objective-C Playgrounds 、さらにFoldifyや3D Game Engineなど、Appleに欠かせないアプリの開発で有名です。品質の高いコードを書いたり、他の人も同じように書けるようにすることにも熱心です。merowing.infoでブログを書いており、公開されているOSSはGitHub github.com/krzysztofzablocki で見ることができます。"
        return speaker
    }(),
    "saraheolson" : { let speaker = Speaker()
        speaker.id = 3
        speaker.name = "Sarah Olson"
        speaker.twitter = "saraheolson"
        speaker.imageAssetName = "sarah.jpg"
        speaker.bio = "Sarah Olson is an iOS developer for Trello at Atlassian. She has over eighteen years of development experience in a variety of technologies, including iOS, Android, Java, and WordPress development. As Director of Women Who Code Twin Cities, she leads a variety of initiatives and events focused on creating a more inclusive tech culture. You can follow her on Twitter at @saraheolson."
        speaker.bioJP = "Sarah Olsonは Atlassian で Trello を作っている iOS 開発者です。 iOS, Android, Java, Wordpress を含む様々な技術領域で18年以上開発しています。 Women Who Code Twin Cities のディレクターとして、より包括的な技術文化の創造に着目した様々な構想やイベントを率いています。Twitter @saraheolson をフォローしましょう。"
        return speaker
    }(),
    "bkase" : { let speaker = Speaker()
        speaker.id = 4
        speaker.name = "Brandon Kase"
        speaker.twitter = "bkase_"
        speaker.imageAssetName = "bkase.jpg"
        speaker.bio = "Brandon Kase brings typed functional programming to weird places. He has shipped production code on Android with Kotlin, iOS with Swift and React Native, and Web with JS/Flow/React. Brandon is currently building a new cryptocurrency at O(1) Labs. He came across functional programming while pursuing a B.S. in Computer Science from Carnegie Mellon University. Brandon is excited that strong static typing and functional programming are becoming mainstream, and believes that techniques once reserved for academia will help industry produce more reliable software."
        speaker.bioJP = "Brandon Kase は型付関数プログラミングを奇妙な場所に導入しています。 Kotlin で Android アプリを、 Swift や React Native で iOS アプリを、そして JS/Flow/React で Web サイトを作ってきました。 今は O(1) Lab で新しい暗号通貨を作っています。彼はカーネギーメロン大学でコンピュータサイエンスの学位を取りながら、関数プログラミングを学んできました。強い静的型付けや関数プログラミングが主流となってきたことにワクワクしており、かつて学問のために進んだ技術が、より品質の高いソフトウェアを作り出すことに役立つと信じています。良い設計のプログラミング言語やライブラリなどにハマっています。"
        return speaker
    }(),
    "tamar" : { let speaker = Speaker()
        speaker.id = 5
        speaker.name = "Tamar Nachmany"
        speaker.twitter = "tamarshmallows"
        speaker.imageAssetName = "tamar.jpg"
        speaker.bio = "Tamar Nachmany has spent the past two years building Tumblr as an iOS engineer on Tumblr's Community, Messaging, and Core iOS teams. She is passionate about learning from technology communities around the world and has given talks about engineering and product design in Germany, Australia, Mexico, the United States, and soon Japan! When she is not writing software she teaches engineering, writes fiction, and organizes an art residency. She lives in New York."
        speaker.bioJP = "Tamar Nachmany はこの２年間、iOS エンジニアとして Tumblr のコミュニティ、メッセージ、コア iOS チームで Tumblr の開発を行ってきました。彼女は、世界中の技術コミュニティから学ぶことに対して情熱を持っており、エンジニアリングやプロダクトデザインのトークをこれまでドイツ、オーストラリア、メキシコ、アメリカで行ってきました。そしてもうすぐ日本でも！ソフトウェア以外では、エンジニアリングを教えたり、小説を書いたり、アートレジデンスを組織しています。ニューヨーク在住。"
        return speaker
    }(),
    "wendy" : { let speaker = Speaker()
        speaker.id = 6
        speaker.name = "Wendy Lu"
        speaker.twitter = "wendyluwho"
        speaker.imageAssetName = "wendy.jpg"
        speaker.bio = "Wendy is an iOS engineer and has been working at Pinterest for the last 5 years. She is currently engineering manager of the Ad Formats team with a focus on mobile. Previously, she led the launch of their commerce product on mobile and has also touched everything from the data layer to the UI frameworks. She has given talks at several iOS conferences and moderates a mobile development panel at Grace Hopper. In a past life she competed on the US Synchronised Swimming National Team."
        speaker.bioJP = "Wendy は iOS エンジニアとして５年間 Pinterest で働いていました。今は、モバイルを中心とした広告フォーマットチームのエンジニアリングマネージャです。以前は、モバイルにおけるコマース製品を立ち上げ、データレイヤーからUIフレームワークに至るまですべてを担当してきました。これまでいくつかのiOSカンファレンスでトークしたり、 Grace Hopper Conference の mobile development panel をモデレートしています。昔は、アメリカのシンクロナイズドスイミングナショナルチームで競い合っていました。"
        return speaker
    }(),
    "samuelgoodwin" : { let speaker = Speaker()
        speaker.id = 7
        speaker.name = "Samuel Goodwin"
        speaker.twitter = "samuelgoodwin"
        speaker.imageAssetName = "samuel.jpg"
        speaker.bio = "Samuel has worked on iOS since the SDK’s first release and has been in Amsterdam for the last 6 years running his company, Roundwall Software. He rides skateboards, plays bass guitar, and rides bikes."
        speaker.bioJP = "Samuel は、SDKの初期リリースからiOSに取り組んでおり、この6年間アムステルダムで Roundwall Software を経営しています。スケートボードに乗ったり、ベースギターを弾いたり、自転車にも乗ります。"
        return speaker
    }(),
    "sash" : { let speaker = Speaker()
        speaker.id = 8
        speaker.name = "Sash Zats"
        speaker.twitter = "zats"
        speaker.imageAssetName = "sash.jpg"
        speaker.bio = "Sash is a software engineer at Facebook working on News Feed. He works on user interaction, animations and experiences that make people smile. Strong believer that, in the future, designers will code and engineers will design because there will be no distinction between two. Days since he broke the like button: 0."
        speaker.bioJP = "Sash はFacebookのソフトウェアエンジニアでニュースフィードを作っています。ユーザーインタラクションやアニメーション、ユーザー体験の向上で、人々に笑顔を与えます。近い将来、デザイナーがコーディングをし、エンジニアがデザインをするようになると確信しています。その壁が無くなるからです。毎日いいね!ボタンを押せるのは彼のおかげです。"
        return speaker
    }(),
    "karl" : { let speaker = Speaker()
        speaker.id = 9
        speaker.name = "Karl von Randow"
        speaker.twitter = "avon"
        speaker.imageAssetName = "karl.jpg"
        speaker.bio = "Back in the olden days Karl was co-founder of Camera+, which sold over 12 million copies on the App Store. More recently he created Vee for Video—an app for quickly shooting, editing and sharing video. He is also the creator of Charles Proxy—a popular desktop app for observing an app’s network traffic—and co-founder of Letterboxd—a social website and app for movie lovers. Karl likes creating things."
        speaker.bioJP = "かつて、Karl は App Store で1200万以上ダウンロードされている Camera+ の Co-Founder でした。 最近では、動画を素早くとったり、編集したり、共有したりする、Vee for Video をいうアプリを作りました。また、アプリのネットワーク監視のデスクトップアプリとして人気のある、Charles Proxy も作っていたり、動画が大好きな人のためのソーシャルウェブサイトとアプリである、 Letterboxd の Co-Founder でもあります。物を作ることが大好きなのです。"
        return speaker
    }(),
    "katsumi" : { let speaker = Speaker()
        speaker.id = 10
        speaker.name = "Katsumi Kishikawa"
        speaker.twitter = "k_katsumi"
        speaker.imageAssetName = "katsumi.jpg"
        speaker.bio = "Katsumi Kishikawa is an iOS/macOS developer working at Realm. He’s a serial open source library developer, and has published some popular libraries on GitHub. He’s also made big contributions to the iOS developer community in Japan with his experience and knowledge."
        speaker.bioJP = "RealmのiOS/macOS開発者。オープンソースの開発を行ったり、有名なライブラリを自身のGitHubに公開している。日本においては、その経験と知識で、日本のiOS開発者コミュニティに大きく貢献している。"
        return speaker
    }(),
    "giginet" : { let speaker = Speaker()
        speaker.id = 11
        speaker.name = "Kohki Miki"
        speaker.twitter = "giginet"
        speaker.imageAssetName = "giginet.png"
        speaker.bio = "Kohki Miki (a.k.a @giginet) is a software engineer at Cookpad. He builds infrastructure for mobile development and works to improve productivity of mobile developers. Also, he builds fastlane tools, as a member of core contributors, and other useful development tools. He likes game development, so he creates some games and writes books about game development."
        speaker.bioJP = "クックパッドのエンジニア。業務ではモバイル向けの開発基盤に携わり、開発者の生産性向上のため尽力している。 OSS では幾つかの開発ツールをホストしているほか、 fastlane tools の Core Contributor でもある。 趣味はインディーゲーム開発。著書に「cocos2d-xで始めるゲーム開発」など"
        return speaker
    }(),
    "ellen" : { let speaker = Speaker()
        speaker.id = 12
        speaker.name = "Ellen Shapiro"
        speaker.twitter = "designatednerd"
        speaker.imageAssetName = "ellen.jpg"
        speaker.bio = "Ellen Shapiro is a native mobile developer who recently moved to the Netherlands. She's been building iOS and Android apps since 2010, and was most recently the lead mobile developer for SpotHero. In addition, Ellen writes and edits iOS and Android tutorials for RayWenderlich.com, and is the lead developer for Hum, a prominent iOS app for songwriting. In her spare time Ellen enjoys playing the guitar, traveling, biking, and hanging out with her girlfriend and their two cats."
        speaker.bioJP = "Ellen Shapiro は最近オランダに移住したネイティブモバイルエンジニアです。 2010年からiOSとAndroidのアプリを作り始めて、最近までは、SpotHero でリードモバイルエンジニアを努めていました。さらに、 RayWenderlich.com でiOSとAndroidのチュートリアルを書いており、 作曲のiOSアプリでは有名な Hum でリードエンジニアを努めています。暇なときは、ギターを弾いたり、旅行したり、自転車に乗ったり、女友達や２匹の猫とぶらぶらしたりしています。"
        return speaker
    }(),
    "shu" : { let speaker = Speaker()
        speaker.id = 13
        speaker.name = "Shuichi Tsutsumi"
        speaker.twitter = "shu223"
        speaker.imageAssetName = "shu223.jpg"
        speaker.bio = "Shuichi has been a freelance iOS developer in Tokyo, and works for Fyusion Inc. in San Francisco since 2016. Co-authored “iOS x BLE Core Bluetooth Programming” (2015) and authored “iOS Programming - Advanced 100 Recipes” (2013). He is the creator of some popular OSS repositories such as iOS Sampler series."
        speaker.bioJP = "元フリーランスiOSエンジニア、2016年末よりサンフランシスコのFyusion社勤務。著書に「iOS BLE Core Bluetooth プログラミング</a>」(2015)、「iOSアプリ開発　達人のレシピ100」（2013）。GitHubで「iOS Sampler」シリーズ他さまざまなオープンソースを公開している。"
        return speaker
    }(),
    "segiddins" : { let speaker = Speaker()
        speaker.id = 14
        speaker.name = "Samuel Giddins"
        speaker.twitter = "segiddins"
        speaker.imageAssetName = "sam.jpg"
        speaker.bio = "Samuel is a developer well-versed in the rituals of writing developer tools that occasionally work. By day, Samuel works on making the mobile developer experience at Square less arduous; by night he can be found breaking Bundler and CocoaPods. Before this whole 'developer' thing, Samuel studied in the highly impractical Mathematics & Economics departments at University of Chicago, learning subjects such as 'numbers', 'social theory', and 'memes'. When not coding, Samuel is often in the kitchen, marveling at the fact that dinner smells better than it looks."
        speaker.bioJP = "Samuel は開発者向けツールを作ることに精通しています。日中は Square におけるモバイル開発者の負担を減らすような仕事をしている開発者で、夜はBundler と CocoaPods の Core Contributor です。  開発者になる前は、シカゴ大学で数学や経済学の学科で、「数」、「社会理論」、「ミーム」のような科目を学んでしました。キッチンに立つことが多く、夕食が見た目よりもにおいの方が良いという事実に驚いています。"
        return speaker
    }(),
    "ben" : { let speaker = Speaker()
        speaker.id = 15
        speaker.name = "Ben Scheirman"
        speaker.twitter = "subdigital"
        speaker.imageAssetName = "ben.jpg"
        speaker.bio = "Ben Scheirman is an independent software developer from Houston, Texas. He is best known for creating NSScreencast, a site that delivers quality training videos on iOS development. Ben has been writing iOS apps since 2009, and has produced more than 300 videos teaching others to do the same. You can find Ben’s website at benscheirman.com or follow him on Twitter @subdigital."
        speaker.bioJP = "Ben Scheirman はヒューストン出身の個人開発者です。iOS開発を動画で学べる NSScreencast を作っていることでよく知られています。Ben は2009年からiOSアプリを作り始めて、300本以上の動画を作成してきました。Webサイト benscheirman.com や Twitter @subdigital をチェックしましょう。"
        return speaker
    }(),
    "javi" : { let speaker = Speaker()
        speaker.id = 16
        speaker.name = "Javier Soto"
        speaker.twitter = "javi"
        speaker.imageAssetName = "javi.jpg"
        speaker.bio = "Javier Soto. Spanish, iOS developer in the SF Bay Area for the past 5 years. Worked at Pebble and Twitter before, now at Twitch. Big fan of Swift. When not writing code, he's playing chess, solving Rubik's cubes or flying planes"
        speaker.bioJP = "Javier Soto はスペイン出身で、SFのベイエリアで5年間iOSエンジニアをしています。以前は、 Pebble や  で働いていて、今は Twitch にいます。Swift の大ファンです。コードを書いていないときは、チェスをしたり、ルービックキューブを解いたり、飛行機を飛ばしています。"
        return speaker
    }(),
    "daisy" : { let speaker = Speaker()
        speaker.id = 17
        speaker.name = "Daisy Ramos"
        speaker.twitter = "daisyr317"
        speaker.imageAssetName = "daisy.jpg"
        speaker.bio = "Daisy is an avid iOS developer and lover of all that is tech. Most recently working on the iOS team at Citi FinTech building data-driven solutions and new features for their consumer banking app. She also actively consults for early stage companies looking to build the next big thing. Daisy holds a B.S in Computer Science from Queens College in NYC, the same college where the try! Swift NYC meetup originated. She now organizes the meetup and hosts a wide variety of technical Swift talks. She can be found on twitter as @daisyr317."
        speaker.bioJP = "Daisy は熱心なiOSエンジニアで技術が大好きです。最近は Citi FinTech でデータドリブンなソリューションを構築したり、自社顧客向けの銀行アプリへの新機能を追加しています。また、将来大きなことを成し遂げようとしているアーリーステージの会社へのコンサルティングにも積極的です。try! Swift NYC meetup の所縁の地でもある、ニューヨークの Queens College でコンピュータサイエンスの学士を取りました。今は多種多様な Swift の技術的なトークが披露されるミートアップを主宰しています。Twitterは @daisyr317 です。"
        return speaker
    }(),
    "david" : { let speaker = Speaker()
        speaker.id = 18
        speaker.name = "David Hoang"
        speaker.twitter = "davidhoang"
        speaker.imageAssetName = "david.jpg"
        speaker.bio = "David Hoang loves Swift, Visual Programming, and infusing the design and engineering process together. In his 15-year career he has worked in B2B at ExactTarget, Brand at HTC, being a founder of a digital studio, Design Director at Black Pixel, and now Head of Product Design at One Medical. He’s worked on three apps featured by Apple and got into programming as a designer with the desire to push ideas to become more tangible. It’s true that he has a VM of Mac OS 9 running so he can use HyperCard. When he’s not working, David likes to collaborate with other designers and engineers, travel, read, and paint. He currently lives in San Francisco, California, but his heart is back in New York City."
        speaker.bioJP = "David Hoang は、 Swift やビジュアルプログラミングが大好きで、デザインとエンジニアリングのプロセスを融合させています。この15年で、 ExactTarget の B2B、HTC のブランド担当、デジタルスタジオの創設者、Black Pixel のデザインディレクターを経て、今では One Medical のプロダクトデザインのヘッドとして働いています。Appleにフィーチャーされた3つのアプリをつくっており、アイディアをより具現化するためにデザイナーとしてプログラミングをはじめました。HyperCardを使えるようにするために、Mac OS 9が動作するVMを持っているのは本当のことです。仕事以外では、他のデザイナーやエンジニアと協業したり、旅行や読書、ペイントするのが好きです。今はサンフランシスコにすんでますが、想い出はニューヨークにあります"
        return speaker
    }(),
    "kate" : { let speaker = Speaker()
        speaker.id = 19
        speaker.name = "Kate Castellano"
        speaker.twitter = "katecastellano"
        speaker.imageAssetName = "kate.png"
        speaker.bio = "Kate Castellano is a Venezuelan Informatics Engineer, specialized in Mobile Development. She started her career as an Android Developer but then decided to change to iOS Development, where she has been working for the past 6 years. One of her passions is to work towards the inclusion of more women in technology, therefore she was the co-organizer of Women Who Go Berlin chapter, Event-Manager for Berlin's Geekettes Mentorship Program and a mentor in Learn It Girl!. She currently works as a Senior iOS Developer for Clue and looks forward to join more organisations. When she is not organising events or coding, you can find her traveling or finding new musicals to sing along to."
        speaker.bioJP = "Kate Castellano はベネズエラ出身のモバイル開発が得意なソフトウェアエンジニアです。初めは Android アプリのエンジニアでしたが、仕事を始めて6年たった頃に、iOSの開発に移りました。テクノロジーに関わる女性を増やすことに高い意欲を持っており、Women Who Go Berlin chapter の共同主催者や、ベルリンの Geekettes Mentorship Program のイベントマネージャ、Learn It Girl! のメンターを務めていました。現在はClue のシニアiOSエンジニアで、さらに参画する組織を探しています。休みの日は旅行に出かけたり、新しいミュージカルを探しています。"
        return speaker
    }(),
    "ezura" : { let speaker = Speaker()
        speaker.id = 20
        speaker.name = "Yuka Ezura"
        speaker.twitter = "eduraaa"
        speaker.imageAssetName = "ezura.png"
        speaker.bio = "Yuka Ezura is an iOS engineer working at LINE. She belongs to the cloud AI platform “Clova” development team. At conferences and many study meetings, she presents topics focused on Swift language. She is also a personality at a web radio station mookmook radio."
        speaker.bioJP = "LINE の iOS エンジニア。クラウド AI プラットフォーム Clova 開発チームに所属。カンファレンスや勉強会で主に Swift を中心にしたテーマで発表している。また、web ラジオ局 mookmook radio でパーソナリティを務めている。"
        return speaker
    }(),
    "pushkar" : { let speaker = Speaker()
        speaker.id = 21
        speaker.name = "Pushkar Kulkarni"
        speaker.twitter = "pushkar_nk"
        speaker.imageAssetName = "pushkar.jpg"
        speaker.bio = "Pushkar Kulkarni is a server-side Swift developer working with IBM. Prior to Swift, he worked on IBM's Java runtime, working on the JIT compiler and the Java standard library. Over the last two years, he has been contributing to open source Swift Foundation, focussed on making URLSession fully functional on Linux. He thinks Swift is the coolest language ever and is excited about the opportunities it offers on the server side."
        speaker.bioJP = "Pushkar Kulkarni は IBM のサーバーサイド Swift の開発者です。Swift に関わる前は、IBM の Java のランタイムの部署にいて、 JIT コンパイラや、 Java の標準ライブラリを開発していました。過去二年間、オープンソース Swift の Foundation にコントリビュートしており、特に Linux の URLSession 関数型の世界にすることに注力しています。Swift は最もクールな言語で、サーバーサイドで提供されることにわくわくしています。"
        return speaker
    }(),
    
    
    
    // Lightning Talk Speakers
    "kita" : { let speaker = Speaker()
        speaker.id = 22
        speaker.name = "Yusuke Kita"
        speaker.twitter = "kitasuke"
        speaker.imageAssetName = "kita.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Yusuke Kita is an iOS developer at Mercari. He works on the internationalization of the Mercari app. He's passionate about learning new technology. When not coding, you can find him cycling."
        speaker.bioJP = "メルカリのiOSエンジニア。iOSチームのMercariアプリの国際化に取り組んでいます。新しい技術を学ぶのが大好きです。コーディングしていないときは、サイクリングをしています。"
        return speaker
    }(),
    "kenmaz" : { let speaker = Speaker()
        speaker.id = 23
        speaker.name = "Kentaro Matsumae"
        speaker.twitter = "kenmaz"
        speaker.imageAssetName = "kenmaz.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Kentaro Matsumae is an engineer at DeNA, where he works on the MangaBox iOS app. Previously, he worked on several other apps including niconico. When not coding, he studies machine learning."
        speaker.bioJP = "DeNA のエンジニア。マンガボックスというサービスの iOS アプリを開発しています。前職ではニコニコ動画のアプリなどを開発していました。最近は趣味で機械学習の勉強をしています。"
        return speaker
    }(),
    "orakaro" : { let speaker = Speaker()
        speaker.id = 24
        speaker.name = "Vu Nhat Minh"
        speaker.twitter = "orakaro"
        speaker.imageAssetName = "orakaro.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Orakaro is an iOS Engineer at Mercari currently working on Atte, the Japanese community classifieds app. Though he had years of backend web programming experiences using languages such as Python or Scala, he decided to move on as a native mobile engineer after figuring out that smartphone apps were doing a better job of impacting the world each and every day. He also enjoys digging around concepts and theories in functional programming, learning abstract algebra and excited to help bring those academy concepts closer to industry products. In spare time Orakaro enjoys playing the ancient game of Go. He is a 2 dan amateur go player."
        speaker.bioJP = "Orakaroは、現在メルカリのiOSエンジニアで、日本の地域コミュニティアプリであるアッテに取り組んでいます。彼は何年にもわたり、PythonやScalaなどの言語を使用したバックエンドWebプログラミングの経験を持っていましたが、スマートフォンアプリが毎日世界に影響を与えるような素晴らしい仕事をしていることを知り、ネイティブモバイルエンジニアとして取り組むことにしました。また、関数プログラミングの概念や理論を掘り下げ、抽象代数を学び、そのアカデミックなコンセプトを業界のプロダクトに近づけることを楽しみにしています。<br><br>時間のあるときには、囲碁を楽しんでいます。二段のアマチュアです。"
        return speaker
    }(),
    "kotetu" : { let speaker = Speaker()
        speaker.id = 25
        speaker.name = "Toru Kuriyama"
        speaker.twitter = "kotetu"
        speaker.imageAssetName = "kotetu.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Toru Kuriyama is an iOS application engineer at Sansan Inc, which handles business card management service, and develops 'Sansan' iOS app for corporations."
        speaker.bioJP = "名刺管理サービスを手がけるSansan株式会社に所属するiOSアプリエンジニアです。法人向け名刺管理サービス 'Sansan' のiOSアプリ開発を担当しています。"
        return speaker
    }(),
    "tattn" : { let speaker = Speaker()
        speaker.id = 26
        speaker.name = "Tatsuya Tanaka"
        speaker.twitter = "tanakasan2525"
        speaker.imageAssetName = "tattn.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Tatsuya Tanaka is an engineer at Yahoo! JAPAN, where he mainly develops transit iOS apps. When not coding, he shares iOS tips at meetups or on his blog. You can find him at Hackathons."
        speaker.bioJP = "ヤフーのエンジニア。業務では主に乗換案内のiOSアプリを開発。 勉強会やブログでSwiftやiOS開発のTipsなどを紹介しています。 ハッカソンが好きで、よく参加しています。"
        return speaker
    }(),
    "yukiasai" : { let speaker = Speaker()
        speaker.id = 27
        speaker.name = "Yuki Asai"
        speaker.twitter = "yukiasai417"
        speaker.imageAssetName = "yukiasai.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Yuki Asai develops iOS apps and server-side apps using Scala. He codes with Swift, Haskell, Ruby, and sometimes ReactNative."
        speaker.bioJP = "iOSアプリを開発したりScalaでサーバーアプリを開発したりしてます。得意な言語はSwift、Haskell、Ruby。あ、ReactNativeもやってます。"
        return speaker
    }(),
    "ihara" : { let speaker = Speaker()
        speaker.id = 28
        speaker.name = "Takeshi Ihara"
        speaker.twitter = "nonchalant0303"
        speaker.imageAssetName = "ihara.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Takeshi Ihara is an iOS engineer of English learning services at Recruit Marketing Partners. He uses server side Swift in his personal apps. When not coding, you can find him bouldering or playing games."
        speaker.bioJP = "リクルートマーケティングパートナーズで英語系の学習サービスのiOSエンジニアをしています。個人サービスでサーバーサイドSwiftを活用しています。趣味はボルダリングと格闘ゲームです。"
        return speaker
    }(),
    "tiago" : { let speaker = Speaker()
        speaker.id = 29
        speaker.name = "Tiago Martinho"
        speaker.twitter = "martinho_t"
        speaker.imageAssetName = "tiago.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Tiago Martinho is a Developer at ThoughtWorks in Barcelona - he created Swift Peer Labs in Barcelona. He loves to create apps, mainly for iOS (he already built more than 15 projects). Tiago is currently studying Machine Learning. He started iOS development professionally with Swift 1.0 in 2014."
        speaker.bioJP = "バルセロナにあるThoghtWorksのエンジニアです、Swift Peer Lab (もくもく会）を開催しています。アプリを作るのが好きで、主にiOSのアプリをつくっています（これまで15以上のプロジェクトを立ち上げました）。今は機械学習を勉強していて、プロとしてiOS開発を始めたのは2014年で、Swift1.0のときでした。"
        return speaker
    }(),
    "hiragram" : { let speaker = Speaker()
        speaker.id = 30
        speaker.name = "Yuya Hirayama"
        speaker.twitter = "hiragram"
        speaker.imageAssetName = "hiragram.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Yuya Hirayama is an iOS engineer at VASILY Inc. He likes the idea of protocol-oriented programming, and pursuing code that realizes type-safe operation with minimal local definition by protocol + protocol extension. Recently, he is pulled toward the strong appeal of server side Swift, focusing more on Swift itself rather than iOS development. Yuya Hirayama also develops a virtual currency service as a side project, including the iOS application and the back-end API using Swift. In addition, he actively speaks at 'iOS Discord' and organizes 'Discord Offline', the first offline event of the community."
        speaker.bioJP = "株式会社VASILY iOSアプリエンジニア プロトコル指向プログラミングの思想が好きで、プロトコル+プロトコル拡張によって局所の定義を最小限に型安全な動作を実現するコードを追求しています。 また、最近はiOS開発よりもよりSwiftそのものに注目できるサーバーサイドSwiftに強い魅力を感じ、サイドプロジェクトとして仮想通貨関連のサービスをiOSアプリからバックエンドのAPIまで通じてSwiftで開発しています。 iOS Discordでアクティブに発言したり、同コミュニティ初のオフラインイベントDiscord Offlineを主宰したりするなど、コミュニティ活動も精力的に行います。"
        return speaker
    }(),
    "tarunon" : { let speaker = Speaker()
        speaker.id = 31
        speaker.name = "Nobuo Saito"
        speaker.twitter = "tarunon"
        speaker.imageAssetName = "tarunon.jpg"
        speaker.type = .lightningTalk
        speaker.bio = "Nobuo Saito is an engineer at Mercari. He likes Swift, games and sleeping, so he has problems with time allocation. He recently bought MHW, so the time required for gaming has doubled. It is serious."
        speaker.bioJP = "株式会社メルカリ所属の iOS エンジニアです。 Swift とゲームと睡眠が好きで、時間配分に悩んでいます。最近 MHW を買ってしまい、ゲームに必要な時間が2倍になってしまいました。大変です。"
        return speaker
    }(),
    
    // Workshop Instructors
    
    "taiji" : { let speaker = Speaker()
        speaker.id = 32
        speaker.name = "Taiji HAGINO"
        speaker.twitter = "taiponrock"
        speaker.imageAssetName = "taiji.jpg"
        speaker.type = .instructor
        speaker.bio = "IBM Developer Advocate. DevRel guy. Specialist for IoT, Web and Mobile Apps. Ale Beer and Rock Musics are my favorites."
        speaker.bioJP = "IBMデベロッパーアドボケイト。DevRelに軸足を置き絶賛活動中。Web、モバイル、IoTあたりのスペシャリスト。エールビールとロックミュージックが大好き。"
        return speaker
    }(),
    "todd" : { let speaker = Speaker()
        speaker.id = 33
        speaker.name = "Todd Kerpelman"
        speaker.twitter = "ToddKerpelman"
        speaker.imageAssetName = "todd.jpg"
        speaker.type = .instructor
        speaker.bio = "Todd Kerpelman is a Developer Advocate at Google, which means he primarily spends his time making YouTube videos and has somehow convinced Google to pay him for it. As of last year, he's been spending most of his time talking about Firebase. Todd has two small children, so his hobbies primarily consist of falling asleep on the couch, attending Moana-themed birthday parties, and reminiscing about the days when he wasn't too tired to have actual hobbies."
        speaker.bioJP = "Todd Kerpelman は Google のデベロッパーアドボケイトです。よく Firebase の Youtube の動画に登場したり、去年は各地で Firebase の講演をしていました。2人の小さな子供がいて、彼の趣味は主にソファでのんびりしたり、Moana をテーマにした誕生会に参加したり、あまりにも疲れていて趣味などなかった日々を想い起こしたりすることです。"
        return speaker
    }(),
    "nicholas" : { let speaker = Speaker()
        speaker.id = 34
        speaker.name = "Nicholas Maccharoli"
        speaker.twitter = "din0sr"
        speaker.imageAssetName = "nicholas.jpg"
        speaker.type = .instructor
        speaker.bio = "Nicholas Maccharoli is an iOS developer working at VASILY. He is the author of the Swift Evolution proposals SE-0053 and SE-0177 and has also made contributions to apple/swift. Visit github.com/nirma if you want to learn more!"
        speaker.bioJP = "Nicholas Maccharoli は VASILY の iOS エンジニアです。Swift Evolution の SE-0053 と SE-0117 のプロポーサルの著者で、apple/swift へもコントリビュートしています。<a href='https://github.com/nirma' target='_blank'>GitHub</a> で詳細をみることができます。"
        return speaker
    }(),
    "ikesyo" : { let speaker = Speaker()
        speaker.id = 35
        speaker.name = "Sho Ikeda"
        speaker.twitter = "ikesyo"
        speaker.imageAssetName = "sho.jpg"
        speaker.type = .instructor
        speaker.bio = "Sho Ikeda is a Swift (corelibs-foundation) contributor, author of Himotoki, maintainer for Carthage, ReactiveSwift, and many more. He currently works at Hatena in Kyoto."
        speaker.bioJP = "Sho Ikeda は Swift (corelibs-foundation) のコントリビュータであり、Himotoki の作者でもあり、Carthage や ReactiveSwift など数多くのライブラリのメンテナーです。現在は京都にある株式会社はてなで働いています。"
        return speaker
    }(),
    "koher" : { let speaker = Speaker()
        speaker.id = 36
        speaker.name = "Yuta Koshizawa"
        speaker.twitter = "koher"
        speaker.imageAssetName = "koher.jpg"
        speaker.type = .instructor
        speaker.bio = "Yuta Koshizawa is a developer at Qoncept. His posts about Swift on Qiita are well known among Japanese iOS developers. He has also been developing SWIFT QUEST, which is an online book for beginners to learn programming from Hello World to monads using only Swift."
        speaker.bioJP = "Qoncept の開発者。Qiita に Swift に関する記事を投稿していて、日本のiOSエンジニアにはよく知られている。また、SWIFT QUEST というプログラミング初心者が Hello world から モナドまで、Swift だけ使って勉強するためのオンラインブックを開発している。"
        return speaker
    }(),
    "thomas" : { let speaker = Speaker()
        speaker.id = 37
        speaker.name = "Thomas Paul Mann"
        speaker.twitter = "thomaspaulmann"
        speaker.imageAssetName = "thomas.jpg"
        speaker.type = .instructor
        speaker.bio = "Thomas Mann is a software engineer at Facebook London, working on AR Studio. He joined Facebook a year ago. Prior to this he worked for various different companies on mobile applications varying from topics like video live streaming to near field communications, between cars and mobile devices."
        speaker.bioJP = "Thomas Mann は Facebook London のソフトウェアエンジニアで、AR Studio に取り組んでいます。昨年 Facebook に入社しました。それ以前は、ビデオライブストリーミングや近距離通信、車とモバイルデバイスの間のトピックなど、さまざまなモバイルアプリケーションのさまざまな企業で働いていました。"
        return speaker
    }(),
    "alex" : { let speaker = Speaker()
        speaker.id = 38
        speaker.name = "Alex Rozanski"
        speaker.twitter = "alexrozanski"
        speaker.imageAssetName = "alex.jpg"
        speaker.type = .instructor
        speaker.bio = "Alex Rozanski is a product engineer currently working on AR Studio. In his spare time he is an avid photographer and traveller."
        speaker.bioJP = "Alex Rozanski は現在 AR Studio で働いているプロダクトエンジニアです。空き時間には熱心に写真を撮ったり、旅行に出かけます。"
        return speaker
    }(),
    "jason" : { let speaker = Speaker()
        speaker.id = 39
        speaker.name = "Jason Harris"
        speaker.twitter = "smeger"
        speaker.imageAssetName = "jason.jpg"
        speaker.type = .instructor
        speaker.bio = "Jason Harris has been creating spiffiness and silliness since ... well, for a long time! He hacked the hell out of OS X in the naughts to create Shapeshifter, the Haxie™ that probably broke all of your apps. And he led the Chicken of the VNC project that got a bit of use back in the day. He wrote much of the frontend of Twitter's #music app that nobody remembers was a thing, and wrote the initial prototype version of Twitter for Apple Watch. He led the initiative to bring Twitter for iPad to parity with the phone version and managed Twitter's iOS Infrastructure team. Now he's doing assorted geekery and sourcery for Facebook's AR efforts in London. And he makes a delicious manhattan and he definitely did not write this bio himself oh no."
        speaker.bioJP = "Jason Harris は長い間 Apple のプラットフォームに取り組んできました。誰も覚えていないであろう Twitter の音楽アプリも作っていました。最近は、Apple Watch 版の Twitter のプロトタイプを作っていました。Twitter の iPad 版のデザイン変更を率いたり、iOS のインフラチームのマネジメントもしていました。今は、ロンドンの Facebook の AR チームで働いています。"
        return speaker
    }(),
    "fb" : { let speaker = Speaker()
        speaker.id = 40
        speaker.name = "Thomas Paul Mann, Alex Rozanski, Jason Harris"
        speaker.hidden = true
        speaker.twitter = "facebook"
        speaker.imageAssetName = "fb.jpg"
        speaker.type = .instructor
        speaker.bio = "NA"
        speaker.bioJP = "NA"
        return speaker
    }(),
    "opensource" : { let speaker = Speaker()
        speaker.id = 41
        speaker.name = "Nicholas Maccharoli & Sho Ikeda"
        speaker.hidden = true
        speaker.twitter = "tryswiftconf"
        speaker.imageAssetName = "opensource.png"
        speaker.type = .instructor
        speaker.bio = "NA"
        speaker.bioJP = "NA"
        return speaker
    }(),
    "peers" : { let speaker = Speaker()
        speaker.id = 42
        speaker.name = "You!"
        speaker.hidden = true
        speaker.twitter = "tryswiftconf"
        speaker.imageAssetName = "Logo_TKO.png"
        speaker.type = .instructor
        speaker.bio = "NA"
        speaker.bioJP = "NA"
        return speaker
    }(),
]
