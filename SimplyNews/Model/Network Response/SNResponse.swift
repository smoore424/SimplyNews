//
//  Response.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/10/21.
//

import Foundation

struct SNResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}



