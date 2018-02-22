//
//  NYC2016Sponsors.swift
//  TrySwiftData
//
//  Created by Tim Oliver on 1/29/17.
//  Copyright © 2017 NatashaTheRobot. All rights reserved.
//

import Foundation

public let tko2018Sponsors: [String : Sponsor] = [
    
    //Platinum
    "line" : {
        let sponsor = Sponsor()
        sponsor.name = "LINE Corporation"
        sponsor.nameJP = "LINE株式会社"
        sponsor.url = "https://engineering.linecorp.com/ja/"
        sponsor.displayURL = "engineering.linecorp.com"
        sponsor.logoAssetName = "line.png"
        sponsor.level = .platinum
        sponsor.priority = 1
        return sponsor
    }(),
    "yahoo" : {
        let sponsor = Sponsor()
        sponsor.name = "Yahoo! JAPAN"
        sponsor.url = "https://www.yahoo.co.jp/"
        sponsor.displayURL = "yahoo.co.jp"
        sponsor.logoAssetName = "yahoo_japan.png"
        sponsor.level = .platinum
        sponsor.priority = 2
        return sponsor
    }(),
    "mercari" : {
        let sponsor = Sponsor()
        sponsor.name = "Mercari, Inc."
        sponsor.nameJP = "株式会社メルカリ"
        sponsor.url = "https://about.mercari.com/"
        sponsor.displayURL = "mercari.com"
        sponsor.logoAssetName = "mercari.png"
        sponsor.level = .platinum
        sponsor.priority = 3
        return sponsor
    }(),
    
    //Gold
    "cyberagent" : {
        let sponsor = Sponsor()
        sponsor.name = "CyberAgent, Inc."
        sponsor.nameJP = "株式会社サイバーエージェント"
        sponsor.url = "https://www.cyberagent.co.jp/"
        sponsor.displayURL = "cyberagent.co.jp"
        sponsor.logoAssetName = "cyberagent.png"
        sponsor.level = .gold
        sponsor.priority = 4
        return sponsor
    }(),
    "cookpad" : {
        let sponsor = Sponsor()
        sponsor.name = "Cookpad Inc."
        sponsor.nameJP = "クックパッド株式会社"
        sponsor.url = "https://info.cookpad.com/"
        sponsor.displayURL = "cookpad.com"
        sponsor.logoAssetName = "cookpad.png"
        sponsor.level = .gold
        sponsor.priority = 5
        return sponsor
    }(),
    "vasily" : {
        let sponsor = Sponsor()
        sponsor.name = "VASILY"
        sponsor.url = "https://vasily.jp/"
        sponsor.displayURL = "vasily.jp"
        sponsor.logoAssetName = "vasily.png"
        sponsor.level = .gold
        sponsor.priority = 6
        return sponsor
    }(),
    "fenrir" : {
        let sponsor = Sponsor()
        sponsor.nameJP = "フェンリル株式会社"
        sponsor.name = "Fenrir Inc."
        sponsor.url = "https://www.fenrir-inc.com/"
        sponsor.displayURL = "fenrir-inc.com"
        sponsor.logoAssetName = "fenrir.png"
        sponsor.level = .gold
        sponsor.priority = 7
        return sponsor
    }(),
    "recruitlifestyle" : {
        let sponsor = Sponsor()
        sponsor.name = "RECRUIT LIFESTYLE CO., LTD."
        sponsor.nameJP = "株式会社リクルートライフスタイル"
        sponsor.url = "https://www.recruit-lifestyle.co.jp/"
        sponsor.displayURL = "recruit-lifestyle.co.jp"
        sponsor.logoAssetName = "recruitlifestyle.png"
        sponsor.level = .gold
        sponsor.priority = 8
        return sponsor
    }(),
    "moneyforward" : {
        let sponsor = Sponsor()
        sponsor.name = "Money Forward, Inc."
        sponsor.nameJP = "株式会社マネーフォワード"
        sponsor.url = "https://corp.moneyforward.com/"
        sponsor.displayURL = "moneyforward.com"
        sponsor.logoAssetName = "moneyforward.png"
        sponsor.level = .gold
        sponsor.priority = 9
        return sponsor
    }(),
    "recruit-mp" : {
        let sponsor = Sponsor()
        sponsor.name = "Recruit Marketing Partners Co., Ltd."
        sponsor.nameJP = "株式会社リクルートマーケティングパートナーズ"
        sponsor.url = "http://www.recruit-mp.co.jp/"
        sponsor.displayURL = "recruit-mp.co.jp"
        sponsor.logoAssetName = "recruit_marketing_partners.png"
        sponsor.level = .gold
        sponsor.priority = 10
        return sponsor
    }(),
    "freee" : {
        let sponsor = Sponsor()
        sponsor.name = "freee K.K."
        sponsor.nameJP = "freee株式会社"
        sponsor.url = "https://corp.freee.co.jp/"
        sponsor.displayURL = "freee.co.jp"
        sponsor.logoAssetName = "freee.png"
        sponsor.level = .gold
        sponsor.priority = 11
        return sponsor
    }(),
    "gamewith" : {
        let sponsor = Sponsor()
        sponsor.name = "GameWith, Inc."
        sponsor.nameJP = "株式会社GameWith"
        sponsor.url = "https://gamewith.co.jp/"
        sponsor.displayURL = "gamewith.co.jp"
        sponsor.logoAssetName = "gamewith.png"
        sponsor.level = .gold
        sponsor.priority = 12
        return sponsor
    }(),
    "dena" : {
        let sponsor = Sponsor()
        sponsor.name = "DeNA Co., Ltd."
        sponsor.nameJP = "株式会社ディー・エヌ・エー"
        sponsor.url = "http://dena.com/jp/"
        sponsor.displayURL = "dena.com/jp"
        sponsor.logoAssetName = "dena.png"
        sponsor.level = .gold
        sponsor.priority = 13
        return sponsor
    }(),
    "handslab" : {
        let sponsor = Sponsor()
        sponsor.name = "HANDS LAB INC."
        sponsor.nameJP = "ハンズラボ株式会社"
        sponsor.url = "https://www.hands-lab.com/"
        sponsor.displayURL = "hands-lab.com"
        sponsor.logoAssetName = "hands_lab.png"
        sponsor.level = .gold
        sponsor.priority = 14
        return sponsor
    }(),
    "showroom" : {
        let sponsor = Sponsor()
        sponsor.name = "SHOWROOM Inc."
        sponsor.nameJP = "SHOWROOM株式会社"
        sponsor.url = "http://showroom.co.jp/"
        sponsor.displayURL = "showroom.co.jp"
        sponsor.logoAssetName = "showroom.png"
        sponsor.level = .gold
        sponsor.priority = 15
        return sponsor
    }(),
    "casareal" : {
        let sponsor = Sponsor()
        sponsor.name = "CASAREAL,inc."
        sponsor.nameJP = "株式会社カサレアル"
        sponsor.url = "https://www.casareal.co.jp/ls/"
        sponsor.displayURL = "casareal.co.jp"
        sponsor.logoAssetName = "casareal.png"
        sponsor.level = .gold
        sponsor.priority = 16
        return sponsor
    }(),
    "wantedly" : {
        let sponsor = Sponsor()
        sponsor.name = "Wantedly, Inc."
        sponsor.nameJP = "ウォンテッドリー株式会社"
        sponsor.url = "https://wantedlyinc.com/ja/"
        sponsor.displayURL = "wantedlyinc.com/ja"
        sponsor.logoAssetName = "wantedly.png"
        sponsor.level = .gold
        sponsor.priority = 17
        return sponsor
    }(),
    "firebase" : {
        let sponsor = Sponsor()
        sponsor.name = "Firebase"
        sponsor.url = "https://firebase.google.com/"
        sponsor.displayURL = "firebase.google.com"
        sponsor.logoAssetName = "firebase.png"
        sponsor.level = .gold
        sponsor.priority = 18
        return sponsor
    }(),
    "twilio" : {
        let sponsor = Sponsor()
        sponsor.name = "Twilio"
        sponsor.url = "https://www.twilio.com/"
        sponsor.displayURL = "twilio.com"
        sponsor.logoAssetName = "twilio.png"
        sponsor.level = .gold
        sponsor.priority = 59
        return sponsor
    }(),
    "ibm" : {
        let sponsor = Sponsor()
        sponsor.name = "IBM"
        sponsor.url = "https://www.ibm.com/developerworks/"
        sponsor.displayURL = "ibm.com/developerworks"
        sponsor.logoAssetName = "ibm.png"
        sponsor.level = .gold
        sponsor.priority = 60
        return sponsor
    }(),
    
    // Silver
    "ookami" : {
        let sponsor = Sponsor()
        sponsor.name = "ookami, inc."
        sponsor.nameJP = "株式会社ookami"
        sponsor.url = "https://ookami.tokyo/"
        sponsor.displayURL = "ookami.tokyo"
        sponsor.logoAssetName = "ookami.png"
        sponsor.level = .silver
        sponsor.priority = 19
        return sponsor
    }(),
    "furyu" : {
        let sponsor = Sponsor()
        sponsor.name = "FURYU Corporation"
        sponsor.nameJP = "フリュー株式会社"
        sponsor.url = "http://www.furyu.jp/"
        sponsor.displayURL = "furyu.jp"
        sponsor.logoAssetName = "furyu.png"
        sponsor.level = .silver
        sponsor.priority = 20
        return sponsor
    }(),
    "gmopepabo" : {
        let sponsor = Sponsor()
        sponsor.name = "GMO Pepabo, Inc."
        sponsor.nameJP = "GMOペパボ株式会社"
        sponsor.url = "https://pepabo.com/"
        sponsor.displayURL = "pepabo.com"
        sponsor.logoAssetName = "gmopepabo.png"
        sponsor.level = .silver
        sponsor.priority = 21
        return sponsor
    }(),
    "picapp" : {
        let sponsor = Sponsor()
        sponsor.name = "PicApp, Inc."
        sponsor.nameJP = "ピックアップ株式会社"
        sponsor.url = "http://picappinc.jp/"
        sponsor.displayURL = "picappinc.jp"
        sponsor.logoAssetName = "picapp.png"
        sponsor.level = .silver
        sponsor.priority = 22
        return sponsor
    }(),
    "mamorio" : {
        let sponsor = Sponsor()
        sponsor.name = "MAMORIO Inc."
        sponsor.nameJP = "MAMORIO株式会社"
        sponsor.url = "http://company.mamorio.jp/"
        sponsor.displayURL = "mamorio.jp"
        sponsor.logoAssetName = "mamorio.png"
        sponsor.level = .silver
        sponsor.priority = 23
        return sponsor
    }(),
    "hatena" : {
        let sponsor = Sponsor()
        sponsor.name = "Hatena Co., Ltd."
        sponsor.nameJP = "株式会社はてな"
        sponsor.url = "http://hatenacorp.jp/"
        sponsor.displayURL = "hatenacorp.jp"
        sponsor.logoAssetName = "hatena.png"
        sponsor.level = .silver
        sponsor.priority = 24
        return sponsor
    }(),
    "nana" : {
        let sponsor = Sponsor()
        sponsor.name = "nana music, Inc."
        sponsor.nameJP = "株式会社nana music"
        sponsor.url = "http://nana-music.com/"
        sponsor.displayURL = "nana-music.com"
        sponsor.logoAssetName = "nana.png"
        sponsor.level = .silver
        sponsor.priority = 25
        return sponsor
    }(),
    "enigmo" : {
        let sponsor = Sponsor()
        sponsor.name = "Enigmo Inc."
        sponsor.nameJP = "株式会社エニグモ"
        sponsor.url = "http://www.enigmo.co.jp/"
        sponsor.displayURL = "enigmo.co.jp"
        sponsor.logoAssetName = "enigmo.png"
        sponsor.level = .silver
        sponsor.priority = 26
        return sponsor
    }(),
    "caraquri" : {
        let sponsor = Sponsor()
        sponsor.name = "Caraquri Inc."
        sponsor.nameJP = "からくり株式会社"
        sponsor.url = "http://caraquri.com/"
        sponsor.displayURL = "caraquri.com"
        sponsor.logoAssetName = "caraquri.png"
        sponsor.level = .silver
        sponsor.priority = 27
        return sponsor
    }(),
    "bitflyer" : {
        let sponsor = Sponsor()
        sponsor.name = "bitFlyer, Inc."
        sponsor.nameJP = "株式会社bitFlyer"
        sponsor.url = "https://bitflyer.jp/"
        sponsor.displayURL = "bitflyer.jp"
        sponsor.logoAssetName = "bitflyer.png"
        sponsor.level = .silver
        sponsor.priority = 28
        return sponsor
    }(),
    "diverse" : {
        let sponsor = Sponsor()
        sponsor.name = "Diverse, Inc."
        sponsor.nameJP = "株式会社Diverse"
        sponsor.url = "https://diverse-inc.co.jp/"
        sponsor.displayURL = "diverse-inc.co.jp"
        sponsor.logoAssetName = "diverse.png"
        sponsor.level = .silver
        sponsor.priority = 29
        return sponsor
    }(),
    "kytrade" : {
        let sponsor = Sponsor()
        sponsor.name = "KYT"
        sponsor.url = "http://www.kytrade.co.jp/"
        sponsor.displayURL = "kytrade.co.jp"
        sponsor.logoAssetName = "kytrade.png"
        sponsor.level = .silver
        sponsor.priority = 61
        return sponsor
    }(),
    
    //Diversity
    "jetbrains" : {
        let sponsor = Sponsor()
        sponsor.name = "JetBrains"
        sponsor.url = "https://www.jetbrains.com/"
        sponsor.displayURL = "jetbrains.com"
        sponsor.logoAssetName = "jetbrains.png"
        sponsor.level = .diversity
        sponsor.priority = 30
        return sponsor
    }(),
    "eureka" : {
        let sponsor = Sponsor()
        sponsor.name = "eureka, Inc."
        sponsor.nameJP = "株式会社エウレカ"
        sponsor.url = "https://eure.jp/"
        sponsor.displayURL = "eure.jp"
        sponsor.logoAssetName = "eureka.png"
        sponsor.level = .diversity
        sponsor.priority = 31
        return sponsor
    }(),
    "firebase2" : {
        let sponsor = Sponsor()
        sponsor.name = "Firebase"
        sponsor.url = "https://firebase.google.com/"
        sponsor.displayURL = "firebase.google.com"
        sponsor.logoAssetName = "firebase.png"
        sponsor.level = .diversity
        sponsor.priority = 32
        return sponsor
    }(),
    "medley" : {
        let sponsor = Sponsor()
        sponsor.name = "Medley, Inc."
        sponsor.nameJP = "株式会社メドレー"
        sponsor.url = "http://www.medley.jp/"
        sponsor.displayURL = "medley.jp"
        sponsor.logoAssetName = "medley.png"
        sponsor.level = .diversity
        sponsor.priority = 33
        return sponsor
    }(),
    "happycom" : {
        let sponsor = Sponsor()
        sponsor.name = "HappyCom Inc."
        sponsor.nameJP = "株式会社ハッピーコム"
        sponsor.url = "https://www.happycom.co.jp/"
        sponsor.displayURL = "happycom.co.jp"
        sponsor.logoAssetName = "happycom.png"
        sponsor.level = .diversity
        sponsor.priority = 34
        return sponsor
    }(),
    
    //Student
    "picapp2" : {
        let sponsor = Sponsor()
        sponsor.name = "PicApp, Inc."
        sponsor.nameJP = "ピックアップ株式会社"
        sponsor.url = "http://picappinc.jp/"
        sponsor.displayURL = "picappinc.jp"
        sponsor.logoAssetName = "picapp.png"
        sponsor.level = .student
        sponsor.priority = 35
        return sponsor
    }(),
    "mamorio2" : {
        let sponsor = Sponsor()
        sponsor.name = "MAMORIO Inc."
        sponsor.nameJP = "MAMORIO株式会社"
        sponsor.url = "http://company.mamorio.jp/"
        sponsor.displayURL = "mamorio.jp"
        sponsor.logoAssetName = "mamorio.png"
        sponsor.level = .student
        sponsor.priority = 36
        return sponsor
    }(),
    "mercari2" : {
        let sponsor = Sponsor()
        sponsor.name = "Mercari, Inc."
        sponsor.nameJP = "株式会社メルカリ"
        sponsor.url = "https://about.mercari.com/"
        sponsor.displayURL = "mercari.com"
        sponsor.logoAssetName = "mercari.png"
        sponsor.level = .student
        sponsor.priority = 37
        return sponsor
    }(),
    "nana2" : {
        let sponsor = Sponsor()
        sponsor.name = "nana music, Inc."
        sponsor.nameJP = "株式会社nana music"
        sponsor.url = "http://nana-music.com/"
        sponsor.displayURL = "nana-music.com"
        sponsor.logoAssetName = "nana.png"
        sponsor.level = .student
        sponsor.priority = 38
        return sponsor
    }(),
    
    // Lanyard
    "sansan" : {
        let sponsor = Sponsor()
        sponsor.name = "Sansan, Inc."
        sponsor.nameJP = "Sansan株式会社"
        sponsor.url = "https://jp.corp-sansan.com/"
        sponsor.displayURL = "jp.corp-sansan.com"
        sponsor.logoAssetName = "sansan.png"
        sponsor.level = .lanyard
        sponsor.priority = 39
        return sponsor
    }(),
    
    // Bag
    "mamorio3" : {
        let sponsor = Sponsor()
        sponsor.name = "MAMORIO Inc."
        sponsor.nameJP = "MAMORIO株式会社"
        sponsor.url = "http://company.mamorio.jp/"
        sponsor.displayURL = "company.mamorio.jp"
        sponsor.logoAssetName = "mamorio.png"
        sponsor.level = .bag
        sponsor.priority = 40
        return sponsor
    }(),
    
    // Event
    "rcube" : {
        let sponsor = Sponsor()
        sponsor.name = "RCUBE, inc."
        sponsor.nameJP = "株式会社アールキューブ"
        sponsor.url = "https://rcubeinc.com/"
        sponsor.displayURL = "rcubeinc.com"
        sponsor.logoAssetName = "rcube.png"
        sponsor.level = .event
        sponsor.priority = 41
        return sponsor
    }(),
    "love_swift" : {
        let sponsor = Sponsor()
        sponsor.name = "Love Swift"
        sponsor.nameJP = "Swift愛好会"
        sponsor.url = "https://love-swift.connpass.com/"
        sponsor.displayURL = "love-swift.connpass.com"
        sponsor.logoAssetName = "love_swift.png"
        sponsor.level = .event
        sponsor.priority = 42
        return sponsor
    }(),
    "retty" : {
        let sponsor = Sponsor()
        sponsor.name = "Retty, inc."
        sponsor.nameJP = "Retty株式会社"
        sponsor.url = "https://corp.retty.me/"
        sponsor.displayURL = "retty.me"
        sponsor.logoAssetName = "retty.png"
        sponsor.level = .event
        sponsor.priority = 43
        return sponsor
    }(),
    "trill" : {
        let sponsor = Sponsor()
        sponsor.name = "TRILL Inc."
        sponsor.nameJP = "TRILL株式会社"
        sponsor.url = "https://trill-corp.jp"
        sponsor.displayURL = "trill-corp.jp"
        sponsor.logoAssetName = "trill.png"
        sponsor.level = .event
        sponsor.priority = 44
        return sponsor
    }(),
    "visits" : {
        let sponsor = Sponsor()
        sponsor.name = "VISITS Technologies Inc."
        sponsor.nameJP = "VISITS Technologies株式会社"
        sponsor.url = "https://visits.world"
        sponsor.displayURL = "visits.world"
        sponsor.logoAssetName = "visits.png"
        sponsor.level = .event
        sponsor.priority = 45
        return sponsor
    }(),
    "ookami2" : {
        let sponsor = Sponsor()
        sponsor.name = "ookami, inc."
        sponsor.nameJP = "株式会社ookami"
        sponsor.url = "https://ookami.tokyo/company/"
        sponsor.displayURL = "ookami.tokyo"
        sponsor.logoAssetName = "ookami.png"
        sponsor.level = .event
        sponsor.priority = 46
        return sponsor
    }(),
    "pivotal" : {
        let sponsor = Sponsor()
        sponsor.name = "Pivotal"
        sponsor.url = "https://pivotal.io/locations/tokyo"
        sponsor.displayURL = "pivotal.io"
        sponsor.logoAssetName = "pivotal.png"
        sponsor.level = .event
        sponsor.priority = 62
        return sponsor
    }(),
    
    // Individual
    "daisuke_nagata" : {
        let sponsor = Sponsor()
        sponsor.name = "Daisuke Nagata"
        sponsor.url = "https://github.com/daisukenagata/MetalReFresh"
        sponsor.displayURL = "github.com/daisukenagata/MetalReFresh"
        sponsor.logoAssetName = "daisuke_nagata.jpg"
        sponsor.level = .individual
        sponsor.priority = 47
        return sponsor
    }(),
    "takayama" : {
        let sponsor = Sponsor()
        sponsor.name = "Kyosuke Takayama"
        sponsor.url = "https://twitter.com/takayama"
        sponsor.displayURL = "twitter.com/takayama"
        sponsor.logoAssetName = "kyosuke_takayama.jpg"
        sponsor.level = .individual
        sponsor.priority = 48
        return sponsor
    }(),
    "clipy" : {
        let sponsor = Sponsor()
        sponsor.name = "clipy"
        sponsor.url = "https://clipy-app.com/"
        sponsor.displayURL = "clipy-app.com"
        sponsor.logoAssetName = "clipy.png"
        sponsor.level = .individual
        sponsor.priority = 49
        return sponsor
    }(),
    "yoshikuni_kato" : {
        let sponsor = Sponsor()
        sponsor.name = "Yoshikuni Kato"
        sponsor.url = "https://twitter.com/yoshikuni_kato"
        sponsor.displayURL = "twitter.com/yoshikuni_kato"
        sponsor.logoAssetName = "yoshikuni_kato.jpg"
        sponsor.level = .individual
        sponsor.priority = 50
        return sponsor
    }(),
    "atsushi_nagase" : {
        let sponsor = Sponsor()
        sponsor.name = "Atsushi Nagase"
        sponsor.url = "https://ja.ngs.io/"
        sponsor.displayURL = "ja.ngs.io"
        sponsor.logoAssetName = "atsushi_nagase.jpg"
        sponsor.level = .individual
        sponsor.priority = 51
        return sponsor
    }(),
    "kobei_tabata" : {
        let sponsor = Sponsor()
        sponsor.name = "Kohei Tabata"
        sponsor.url = "https://twitter.com/nerd0geek1"
        sponsor.displayURL = "twitter.com/nerd0geek1"
        sponsor.logoAssetName = "kobei_tabata.jpg"
        sponsor.level = .individual
        sponsor.priority = 52
        return sponsor
    }(),
    "koji_okada" : {
        let sponsor = Sponsor()
        sponsor.name = "Koji Okada"
        sponsor.url = "http://backapp.co.jp/"
        sponsor.displayURL = "backapp.co.jp"
        sponsor.logoAssetName = "koji_okada.jpg"
        sponsor.level = .individual
        sponsor.priority = 53
        return sponsor
    }(),
    "shingo_sato" : {
        let sponsor = Sponsor()
        sponsor.name = "Shingo Sato"
        sponsor.url = "http://egg-is-world.com/"
        sponsor.displayURL = "egg-is-world.com"
        sponsor.logoAssetName = "shingo_sato.jpg"
        sponsor.level = .individual
        sponsor.priority = 54
        return sponsor
    }(),
    "frnk" : {
        let sponsor = Sponsor()
        sponsor.name = "Daigo Wakabayashi"
        sponsor.url = "https://twitter.com/frnk"
        sponsor.displayURL = "twitter.com/frnk"
        sponsor.logoAssetName = "daigo_wakabayashi.jpg"
        sponsor.level = .individual
        sponsor.priority = 55
        return sponsor
    }(),
    "solti" : {
        let sponsor = Sponsor()
        sponsor.name = "Hiroyuki Aoki"
        sponsor.url = "https://twitter.com/Solti"
        sponsor.displayURL = "twitter.com/Solti"
        sponsor.logoAssetName = "hiroyuki_aoki.jpg"
        sponsor.level = .individual
        sponsor.priority = 56
        return sponsor
    }(),
    "takuto_nagano" : {
        let sponsor = Sponsor()
        sponsor.name = "Takuto Nagano"
        sponsor.url = "https://www.facebook.com/takuto.nagano.7"
        sponsor.displayURL = "facebook.com/takuto.nagano.7"
        sponsor.logoAssetName = "takuto_nagano.jpg"
        sponsor.level = .individual
        sponsor.priority = 57
        return sponsor
    }(),
    "lihsuan_chen" : {
        let sponsor = Sponsor()
        sponsor.name = "Lihsuan Chen"
        sponsor.url = "https://github.com/vc7"
        sponsor.displayURL = "github.com/vc7"
        sponsor.logoAssetName = "vc7.png"
        sponsor.level = .individual
        sponsor.priority = 68
        return sponsor
    }(),
]

