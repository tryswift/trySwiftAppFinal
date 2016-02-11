//
//  Sponsor.swift
//  trySwift
//
//  Created by Natasha Murashev on 2/10/16.
//  Copyright © 2016 NatashaTheRobot. All rights reserved.
//

import UIKit

struct Sponsor {
    
    enum Level: Int {
        case Diamond, Gold, Silver
        
        var title: String {
            switch self {
                case .Diamond: return "Diamond"
                case .Gold: return "Gold"
                case .Silver: return "Silver"
            }
        }
    }
    
    let name: String
    let website: String
    let twitter: String?
    let logo: UIImage
    let level: Level
    let description: String?
}

extension Sponsor {
    
    static let diamondSponsors = [realm, cyberAgent]
    static let goldSponsors = [mercari, line, kytrade]
    static let silverSponsors = [fenrir, denso, voyageGroup, dena, freee, nineDrafts, goodpatch, hatena, github, mixi, yahoo, cookpad, toreta, fablic, recruit, classMethod, furyu, retty, sansan, speee, chatwork, pepabo, wondershake, ubiregi, togetter, ride, nikkei, prtimes, ohaki, ookami, perfect, instagram]
    
    // MARK: Diamond Sponsors
    static let realm = Sponsor(
        name: "Realm",
        website: "realm.io",
        twitter: "realm",
        logo: UIImage(named: "realm")!,
        level: .Diamond,
        description: nil
    )
    
    static let cyberAgent = Sponsor(
        name: "CyberAgent, Inc.",
        website: "www.cyberagent.co.jp",
        twitter: "CyberAgent_PR",
        logo: UIImage(named: "calogo")!,
        level: .Diamond,
        description: nil
    )
    
    // MARK: Gold Sponsors
    static let mercari = Sponsor(
        name: isJapanese ? "株式会社メルカリ" : "Mercari",
        website: "www.mercari.com",
        twitter: "mercari_jp",
        logo: UIImage(named: "mercari")!,
        level: .Gold,
        description: nil
    )
    
    static let kytrade = Sponsor(
        name: isJapanese ? "ケイワイトレード 株式会社" : "KY Trade",
        website: "www.kytrade.co.jp",
        twitter: nil,
        logo: UIImage(named: "kyt")!,
        level: .Gold,
        description: nil
    )
    
    static let line = Sponsor(
        name: isJapanese ? "LINE株式会社" : "LINE",
        website: "linecorp.com",
        twitter: "LINEjp_official",
        logo: UIImage(named: "line")!,
        level: .Gold,
        description: nil
    )
    
    // MARK: Silver Sponsors
    
    static let fenrir = Sponsor(
        name: isJapanese ? "フェンリル株式会社" : "Fenrir Inc.",
        website: "www.fenrir-inc.com",
        twitter: "fenrir_official",
        logo: UIImage(named: "fenrir")!,
        level: .Silver,
        description: nil
    )
    
    static let denso = Sponsor(
        name: "DENSO IT Laboratory, Inc.",
        website: "www.d-itlab.co.jp",
        twitter: "densoitlab",
        logo: UIImage(named: "denso")!,
        level: .Silver,
        description: nil
    )
    
    static let voyageGroup = Sponsor(
        name: "VOYAGE GROUP",
        website: "voyagegroup.com",
        twitter: "tech_voyage",
        logo: UIImage(named: "voyage")!,
        level: .Silver,
        description: nil
    )
    
    static let dena = Sponsor(
        name: isJapanese ? "株式会社ディー・エヌ・エー" : "DeNa",
        website: "dena.com",
        twitter: "DeNACorp",
        logo: UIImage(named: "dena")!,
        level: .Silver,
        description: nil
    )
    
    static let freee = Sponsor(
        name: isJapanese ? "freee株式会社" : "freee",
        website: "freee.co.jp",
        twitter: "freee_jp",
        logo: UIImage(named: "freee")!,
        level: .Silver,
        description: nil
    )
    
    static let nineDrafts = Sponsor(
        name: "Nine Drafts Inc.",
        website: "9drafts.com",
        twitter: "9drafts",
        logo: UIImage(named: "ninedrafts")!,
        level: .Silver,
        description: nil
    )
    
    static let goodpatch = Sponsor(
        name: "Goodpatch, Inc.",
        website: "goodpatch.com",
        twitter: "GoodpatchTokyo",
        logo: UIImage(named: "goodpatch")!,
        level: .Silver,
        description: nil
    )
    
    static let hatena = Sponsor(
        name: isJapanese ? "株式会社はてな" : "Hatena",
        website: "hatena.ne.jp",
        twitter: "hatenapr",
        logo: UIImage(named: "hatena")!,
        level: .Silver,
        description: nil
    )
    
    static let github = Sponsor(
        name: "Github",
        website: "github.com",
        twitter: "github",
        logo: UIImage(named: "github")!,
        level: .Silver,
        description: nil
    )
    
    static let mixi = Sponsor(
        name: isJapanese ? "株式会社ミクシィ" : "mixi",
        website: "mixi.co.jp",
        twitter: "mixi_engineers",
        logo: UIImage(named: "mixi")!,
        level: .Silver,
        description: nil
    )
    
    static let yahoo = Sponsor(
        name: "Yahoo! JAPAN",
        website: "yahoo.co.jp",
        twitter: "yahoo",
        logo: UIImage(named: "yahoo")!,
        level: .Silver,
        description: nil
    )
    
    static let cookpad = Sponsor(
        name: isJapanese ? "クックパッド株式会社" : "Cookpad",
        website: "cookpad.com",
        twitter: "cookpad_pr",
        logo: UIImage(named: "cookpad")!,
        level: .Silver,
        description: nil
    )
    
    static let toreta = Sponsor(
        name: isJapanese ? "株式会社トレタ" : "TORETA",
        website: "toreta.in",
        twitter: "TORETA_official",
        logo: UIImage(named: "toreta")!,
        level: .Silver,
        description: nil
    )
    
    static let fablic = Sponsor(
        name: isJapanese ? "株式会社トレタ" : "Fablic",
        website: "fablic.co.jp",
        twitter: "friljp",
        logo: UIImage(named: "fablic")!,
        level: .Silver,
        description: nil
    )
    
    static let recruit = Sponsor(
        name: isJapanese ? "株式会社リクルートマーケティングパートナーズ" : "RECRUIT",
        website: "recruit-mp.co.jp",
        twitter: "recruit_pr",
        logo: UIImage(named: "recruit-mp")!,
        level: .Silver,
        description: nil
    )
    
    static let classMethod = Sponsor(
        name: isJapanese ? "クラスメソッド株式会社" : "Class Method",
        website: "classmethod.jp",
        twitter: "classmethod",
        logo: UIImage(named: "classmethod")!,
        level: .Silver,
        description: nil
    )
    
    static let furyu = Sponsor(
        name: isJapanese ? "フリュー株式会社" : "FuRyu",
        website: "furyu.jp",
        twitter: "furyupr",
        logo: UIImage(named: "furyu")!,
        level: .Silver,
        description: nil
    )
    
    static let retty = Sponsor(
        name: "Retty, Inc.",
        website: "corp.retty.me",
        twitter: "Retty_jp",
        logo: UIImage(named: "retty")!,
        level: .Silver,
        description: nil
    )

    static let sansan = Sponsor(
        name: isJapanese ? "Sansan株式会社" : "Sansan",
        website: "jp.corp-sansan.com",
        twitter: "sansanjapan",
        logo: UIImage(named: "sansan")!,
        level: .Silver,
        description: nil
    )
    
    static let speee = Sponsor(
        name: isJapanese ? "株式会社Speee" : "Speee",
        website: "speee.jp",
        twitter: "speeeinfo",
        logo: UIImage(named: "speee")!,
        level: .Silver,
        description: nil
    )
    
    static let chatwork = Sponsor(
        name: isJapanese ? "チャットワーク株式会社" : "chatwork",
        website: "chatwork.com/ja/",
        twitter: "chatwork_ja",
        logo: UIImage(named: "chatwork")!,
        level: .Silver,
        description: nil
    )
    
    static let pepabo = Sponsor(
        name: isJapanese ? "GMOペパボ株式会社" : "GMO Pepabo Inc.",
        website: "pepabo.com",
        twitter: "pepabo",
        logo: UIImage(named: "pepabo")!,
        level: .Silver,
        description: nil
    )
    
    static let wondershake = Sponsor(
        name: isJapanese ? "株式会社Wondershake" : "Wondershake",
        website: "locari.jp",
        twitter: "Wondershake",
        logo: UIImage(named: "wondershake")!,
        level: .Silver,
        description: nil
    )
    
    static let ubiregi = Sponsor(
        name: isJapanese ? "株式会社ユビレジ" : "Ubiregi",
        website: "ubiregi.com/ja",
        twitter: "ubiregi",
        logo: UIImage(named: "ubiregi")!,
        level: .Silver,
        description: nil
    )
    
    static let togetter = Sponsor(
        name: isJapanese ? "株式会社ユビレジ" : "togetter",
        website: "togetter.com",
        twitter: "togetter_jp",
        logo: UIImage(named: "togetter")!,
        level: .Silver,
        description: nil
    )
    
    static let ride = Sponsor(
        name: "ride",
        website: "ride.com",
        twitter: "ride",
        logo: UIImage(named: "ride")!,
        level: .Silver,
        description: nil
    )
    
    static let nikkei = Sponsor(
        name: isJapanese ? "日本経済新聞社" : "NIKKEI",
        website: "www.nikkei.com",
        twitter: "nikkei",
        logo: UIImage(named: "nikkei")!,
        level: .Silver,
        description: nil
    )
    
    static let prtimes = Sponsor(
        name: isJapanese ? "株式会社PR TIMES" : "PRTIMES",
        website: "prtimes.co.jp",
        twitter: "PRTIMES_JP",
        logo: UIImage(named: "prtimes")!,
        level: .Silver,
        description: nil
    )
    
    static let ohaki = Sponsor(
        name: isJapanese ? "株式会社オハコ" : "OHAKO",
        website: "ohako-inc.jp",
        twitter: "OhakoJP",
        logo: UIImage(named: "ohako")!,
        level: .Silver,
        description: nil
    )
    
    static let ookami = Sponsor(
        name: isJapanese ? "株式会社ookami" : "ookami!",
        website: "playerapp.tokyo",
        twitter: "Player_twi",
        logo: UIImage(named: "ookami")!,
        level: .Silver,
        description: nil
    )
    
    static let perfect = Sponsor(
        name: "Perfect",
        website: "perfect.org",
        twitter: "perfectlysoft",
        logo: UIImage(named: "perfect")!,
        level: .Silver,
        description: nil
    )
    
    static let instagram = Sponsor(
        name: "Instagram",
        website: "instagram.com",
        twitter: "instagram",
        logo: UIImage(named: "Instagram")!,
        level: .Silver,
        description: nil
    )
}