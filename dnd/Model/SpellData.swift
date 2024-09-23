//
//  SpellData.swift
//  dnd
//
//  Created by Trevor Sutherland on 9/23/24.
//

import Foundation

struct SpellData: Decodable {
    let count: Int
    let results: [Results]
}
struct Results: Decodable {
    let index: String
    let name: String
    let level: Int
    let url: String
}
