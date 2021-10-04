//
//  Houseware.swift
//  ACNHDemo
//
//  Created by 楊朝富 on 2021/7/19.
//

import Foundation

// MARK: - Houseware
struct Houseware: Codable {
    let variant, bodyTitle, pattern, patternTitle: String?
    let isDIY, canCustomizeBody, canCustomizePattern: Bool
    let kitCost: String?
    let color1, color2: Color
    let size: Size
    let source: Source
    let sourceDetail: String
    let version: Version
    let hhaConcept1, hhaConcept2: HhaConcept?
    let hhaSeries: HhaSeries?
    let hhaSet: String?
    let isInteractive: Bool
    let tag: Tag
    let isOutdoor: Bool
    let speakerType: SpeakerType?
    let lightingType: LightingType?
    let isCatalog: Bool
    let fileName: String
    let variantID: String?
    let internalID: Int
    let name: Name
    let buyPrice: Int?
    let sellPrice: Int
    let imageURI: String

    enum CodingKeys: String, CodingKey {
        case variant
        case bodyTitle = "body-title"
        case pattern
        case patternTitle = "pattern-title"
        case isDIY, canCustomizeBody, canCustomizePattern
        case kitCost = "kit-cost"
        case color1 = "color-1"
        case color2 = "color-2"
        case size, source
        case sourceDetail = "source-detail"
        case version
        case hhaConcept1 = "hha-concept-1"
        case hhaConcept2 = "hha-concept-2"
        case hhaSeries = "hha-series"
        case hhaSet = "hha-set"
        case isInteractive, tag, isOutdoor
        case speakerType = "speaker-type"
        case lightingType = "lighting-type"
        case isCatalog
        case fileName = "file-name"
        case variantID = "variant-id"
        case internalID = "internal-id"
        case name
        case buyPrice = "buy-price"
        case sellPrice = "sell-price"
        case imageURI = "image_uri"
    }
}

enum Color: String, Codable {
    case aqua = "Aqua"
    case beige = "Beige"
    case black = "Black"
    case blue = "Blue"
    case brown = "Brown"
    case colorful = "Colorful"
    case gray = "Gray"
    case green = "Green"
    case none = "None"
    case orange = "Orange"
    case pink = "Pink"
    case purple = "Purple"
    case red = "Red"
    case white = "White"
    case yellow = "Yellow"
}

enum HhaConcept: String, Codable {
    case bathroom = "bathroom"
    case childSRoom = "child's room"
    case concert = "concert"
    case den = "den"
    case expensive = "expensive"
    case facility = "facility"
    case fancy = "fancy"
    case fitness = "fitness"
    case folkArt = "folk art"
    case freezingCold = "freezing cold"
    case garage = "garage"
    case garden = "garden"
    case horror = "horror"
    case kitchen = "kitchen"
    case livingRoom = "living room"
    case music = "music"
    case ocean = "ocean"
    case office = "office"
    case outdoors = "outdoors"
    case party = "party"
    case school = "school"
    case shop = "shop"
    case space = "space"
    case zenStyle = "zen-style"
}

enum HhaSeries: String, Codable {
    case antique = "antique"
    case bamboo = "bamboo"
    case bunnyDay = "Bunny Day"
    case cardboard = "cardboard"
    case cherryBlossoms = "cherry blossoms"
    case cute = "cute"
    case diner = "diner"
    case festivale = "Festivale"
    case festive = "festive"
    case flowers = "flowers"
    case frozen = "frozen"
    case fruits = "fruits"
    case golden = "golden"
    case iron = "iron"
    case ironwood = "ironwood"
    case log = "log"
    case mario = "Mario"
    case mermaid = "mermaid"
    case mush = "mush"
    case pirate = "pirate"
    case rattan = "rattan"
    case shell = "shell"
    case spooky = "spooky"
    case stars = "stars"
    case throwback = "throwback"
    case treeSBountyOrLeaves = "tree's bounty or leaves"
    case wedding = "wedding"
    case wooden = "wooden"
    case woodenBlock = "wooden block"
    case zen = "zen"
}

enum LightingType: String, Codable {
    case candle = "Candle"
    case emission = "Emission"
    case fluorescent = "Fluorescent"
    case monitor = "Monitor"
    case spotlight = "Spotlight"
}

enum Size: String, Codable {
    case the15X15 = "1.5x1.5"
    case the1X05 = "1x0.5"
    case the1X1 = "1x1"
    case the2X05 = "2x0.5"
    case the2X1 = "2x1"
    case the2X2 = "2x2"
    case the3X1 = "3x1"
    case the3X2 = "3x2"
    case the3X3 = "3x3"
    case the05X1 = "0.5x1"
    case the1X15 = "1x1.5"
    case the1X2 = "1x2"
    case the2X15 = "2x1.5"
}

enum Source: String, Codable {
    case birthday = "Birthday"
    case cJ = "C.J."
    case crafting = "Crafting"
    case craftingJack = "Crafting; Jack"
    case craftingNookSCranny = "Crafting; Nook's Cranny"
    case craftingNookSCrannyFranklin = "Crafting; Nook's Cranny; Franklin"
    case cyrus = "Cyrus"
    case flick = "Flick"
    case gullivarrr = "Gullivarrr"
    case gulliver = "Gulliver"
    case jingle = "Jingle"
    case luna = "Luna"
    case nookMilesRedemption = "Nook Miles Redemption"
    case nookSCranny = "Nook's Cranny"
    case nookSCrannyPavé = "Nook's Cranny; Pavé"
    case nookShoppingPromotion = "Nook Shopping Promotion"
    case nookShoppingSeasonal = "Nook Shopping Seasonal"
    case pavé = "Pavé"
    case startingItems = "Starting items"
    
    case allVillagers = "All villagers"
    case blathers = "Blathers"
    case craftingAllVillagers = "Crafting; All villagers"
    case hha = "HHA"
    case jack = "Jack"
    case mom = "Mom"
    case nintendoNookShoppingDailySelection = "Nintendo; Nook Shopping Daily Selection"
}

enum SpeakerType: String, Codable {
    case hiFi = "Hi-fi"
    case phono = "Phono"
    case retro = "Retro"
}

enum Tag: String, Codable {
    case animal = "Animal"
    case arch = "Arch"
    case audio = "Audio"
    case bathroomThings = "Bathroom Things"
    case bathtub = "Bathtub"
    case bed = "Bed"
    case chair = "Chair"
    case chest = "Chest"
    case clock = "Clock"
    case compass = "Compass"
    case desk = "Desk"
    case dresser = "Dresser"
    case easter = "Easter"
    case empty = ""
    case facilityDecor = "Facility Decor"
    case fan = "Fan"
    case fireplace = "Fireplace"
    case fish = "Fish"
    case folkCraftDecor = "Folk Craft Decor"
    case garden = "Garden"
    case heating = "Heating"
    case homeAppliances = "Home Appliances"
    case hospital = "Hospital"
    case insect = "Insect"
    case japaneseStyle = "Japanese Style"
    case kitchen = "Kitchen"
    case kitchenThings = "Kitchen Things"
    case lamp = "Lamp"
    case museum = "Museum"
    case musicalInstrument = "Musical Instrument"
    case musicalInstruments = "Musical instruments"
    case office = "Office"
    case outdoorsDecor = "Outdoors Decor"
    case plants = "Plants"
    case playground = "Playground"
    case ranch = "Ranch"
    case school = "School"
    case screen = "Screen"
    case seaside = "Seaside"
    case seasonalDecor = "Seasonal Decor"
    case sewingTable = "Sewing Table"
    case shelf = "Shelf"
    case shop = "Shop"
    case shopping = "Shopping"
    case sofa = "Sofa"
    case space = "Space"
    case sports = "Sports"
    case study = "Study"
    case supplies = "Supplies"
    case table = "Table"
    case tagSeasonalDecor = "Seasonal decor"
    case toilet = "Toilet"
    case toy = "Toy"
    case tv = "TV"
    case vehicle = "Vehicle"
    case workBench = "Work Bench"
    case zenStyle = "Zen-style"
}

enum Version: String, Codable {
    case the100 = "1.0.0"
    case the110 = "1.1.0"
    case the120 = "1.2.0"
    case the130 = "1.3.0"
    case the140 = "1.4.0"
    case the150 = "1.5.0"
    case the160 = "1.6.0"
    case the170 = "1.7.0"
    case the180 = "1.8.0"
}

typealias Housewares = [String: [Houseware]]
