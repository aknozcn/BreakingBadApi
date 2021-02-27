//
//  BreakingBadResponse.swift
//  BreakingBadApi
//
//  Created by sh3ll on 14.02.2021.
//

import Foundation


struct Chars: Codable {

    let char_id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: String
    let appearance: [Int]?
    let nickname: String
    let portrayed: String
    let category: String
    let better_call_saul_appearance: [Int]?
}
