//
//  Characters.swift
//  Characters
//
//  Created by Roman Kiruxin on 18.04.2022.
//

import Foundation

struct RMCharacterInfoModel: Decodable {
    let info: Info
    var results: [RMCharacter]
}

struct Info: Decodable {
    let pages: Int
}

public struct RMCharacter: Decodable {
    public let name: String
    public let status: String
    public let species: String
    public let gender: String
    public let location: RMLocation
    public let image: String
    public let episode: [String]
}

public struct RMLocation: Decodable {
    public let name: String
    public let url: String
}

