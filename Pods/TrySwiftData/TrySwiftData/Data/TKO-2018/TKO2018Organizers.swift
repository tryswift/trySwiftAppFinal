//
//  NYC2016Speakers.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/28/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let tko2018Organizers: [String : Organizer] = [
    "natashatherobot" : {
        let natashatherobot = Organizer()
        natashatherobot.id = 1
        natashatherobot.hidden = true
        natashatherobot.name = "Natasha Murashev"
        natashatherobot.twitter = "NatashaTheRobot"
        natashatherobot.imageAssetName = "natasha.jpg"
        natashatherobot.bio = "Natasha is an iOS developer by day and a robot by night. She blogs about Swift, watchOS, and iOS development on her blog, NatashaTheRobot.com and organizes the try! Swift Conference around the world (including this one!). She's currently living the digital nomad life as her alter identity: @NatashaTheNomad."
        natashatherobot.bioJP = "昼間はiOSデベロッパ、夜はロボットです。NatashaTheRobot.comでSwiftやwatchOS、iOS開発に関するブログを書いています。急成長中の週刊Swiftニュースレター、This Week in Swiftや（今回を含めて）世界中で try! Swift カンファレンスを運営しています。現在は@NatashaTheNomadとしてデジタルノマド生活を送っています。"
        return natashatherobot
    }(),
    "satoshi" : {
        let organizer = Organizer()
        organizer.id = 2
        organizer.hidden = true
        organizer.name = "Satoshi Hachiya"
        organizer.twitter = "jpmartha_jp"
        organizer.imageAssetName = "jpmarthajp.jpg"
        organizer.bio = "Satoshi is a Japanese iOS developer working at R CUBE, inc. and ookami, Inc. Mostly, he takes part in R CUBE's wedding service, Hanacolle. He was a speaker at Mobile Optimized 2017 in Belarus. He is also a founder of Pancake Meetup taken place in Tokyo, San Jose, and New York so far. You can find him with a profile picture of pancakes on Twitter, GitHub and Instagram.🥞"
        organizer.bioJP = "株式会社アールキューブと株式会社ookamiのiOS>デペロッパーです。 おもに株式会社アールキューブが運営するウェディングサービス、ハナコレに参画しています。ベラルーシのMobile Optimized 2017で講演しました。また、これまで東京とサンノゼ、ニューヨークでPancake Meetupを開催しています。Twitter、GitHub、Instagramではパンケーキのアイコンで活動しています。🥞"
        return organizer
    }(),
    "jollyjoester" : {
        let organizer = Organizer()
        organizer.id = 3
        organizer.hidden = true
        organizer.name = "Hideyuki Nanashima"
        organizer.twitter = "jollyjoester"
        organizer.imageAssetName = "jollyjoester.jpg"
        organizer.bio = "Hideyuki is a Swift lover and focusing to enjoy learning and playing with Swift more. He organizes Swift愛好会 which is the group where Swift lovers gather in Japan. He is also the most famous Kanpai-er(person who make a toast). He is expanding the circle of Swift lovers with Kanpai."
        organizer.bioJP = "Swift>愛好会</a>会長です。みんなでもっとSwiftを楽しめるようなネタを探してます。かんぱいやー（勉強会で乾杯をする人）としても知られていて、乾杯の力でSwift好きの輪を広めています。"
        return organizer
    }(),
    "ddate" : {
        let organizer = Organizer()
        organizer.id = 4
        organizer.hidden = true
        organizer.name = "Daiki Matsudate"
        organizer.twitter = "d_date"
        organizer.imageAssetName = "ddate.jpg"
        organizer.bio = "Daiki has been developing iOS apps for 7 years, since he was student. He is a member of organizers of CLEM, which is meetup for English learners of engineers / designers in Japan, and fastlane funclub, which is meetup for fastlane users in Japan. Also, he has given talks on Serverlessconf and other conferences, and sometimes translates Realm News into Japanese. He loves traveling in Japan, so recently he helps to hold meetups in Japan other than in Tokyo."
        organizer.bioJP = "大学在学中からiOSアプリ開発を始めて、現在フリーランスのエンジニアとして活動しています。アプリ開発だけでなく、エンジニアやデザイナーで英語を頑張りたい人のための CLEM や、国内のfastlaneコミュニティであるfastlane勉強会</a>などの勉強会運営や、Serverlessconfなどのカンファレンスでの登壇、 Realm Newsの翻訳を行なっています。国内を旅行するのが好きで、最近では東京以外の場所での勉強会にもよく参加しています。"
        return organizer
    }(),
    "saku" : {
        let organizer = Organizer()
        organizer.id = 5
        organizer.hidden = true
        organizer.name = "Yoichiro Sakurai"
        organizer.twitter = "saku2saku"
        organizer.imageAssetName = "saku.jpg"
        organizer.bio = "I'm engineer at Retty, Inc. Retty is popular gourmet service in Japan. I develop iOS app, and involved in app renewal two times (It was made full scratch!). I also make API server by Java/Kotlin, and make development environment using Docker/Kubernetes."
        organizer.bioJP = "Retty株式会社</a>のエンジニアです。RettyというグルメアプリのiOSアプリの開発を担当し、2回のiOSアプリのフルリニューアルに関わりました。開発業務の対象は幅広くJava/Kotlinを使ったAPIサーバの開発からDockerを使った開発基盤の構築まで幅広い業務を行っています。"
        return organizer
    }(),
    "nino" : {
        let organizer = Organizer()
        organizer.id = 6
        organizer.hidden = true
        organizer.name = "Nino Sakuma"
        organizer.twitter = "yucovin"
        organizer.imageAssetName = "yucovin.jpg"
        organizer.bio = "Nino Sakuma ( a. k. a. yucovin ) is a designer and a painter in Japan. She loves Apple products so much that she became an iOS developer. She is an instructor of iOS app development course for beginners `App Creator Dojo(App-Dojo)`. Web site: Apple Blog `Motto shiritai Ringo arekore`. Riko, the mascot of try! Swift, is designed by her."
        organizer.bioJP = "フリーランスのイラストレーター兼デザイナー。アップル製品好きがこうじてiOSデベロッパーにもなりました。初心者向けiOSアプリ開発講座「 アプリ道場（アプリクリエイター道場）」の講師。Apple イラストブログ 「 もっと知りたいリンゴあれこれ（リンあれ）」。try! Swiftのマスコットキャラクターの「Riko」のデザインを担当しています。"
        return organizer
    }(),
    "matt" : {
        let organizer = Organizer()
        organizer.id = 7
        organizer.hidden = true
        organizer.name = "Matt Gillingham"
        organizer.twitter = "gillygize"
        organizer.imageAssetName = "matt.jpg"
        organizer.bio = "Matt Gillingham is currently co-founder and CTO of Eventacular.  He has been developing on the iOS platform for 9 years and has organized the monthly Tokyo iOS Meetup for 7 years. He knows kung fu.."
        organizer.bioJP = "株式会社Eventacularの共同創業者とCTOです。9>年間iOSプラットフォームを開発して、7>年間Tokyo iOS Meetupをオーガナイズしています。カンフーもやります。"
        return organizer
    }()
]
