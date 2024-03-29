//
//  Quiz.swift
//  P5-Quiz
//
//  Created by Adrian on 04/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation

// Decodable makes it simplier decode it form a JSON


struct Quiz: Decodable {
    let id: Int
    let question: String
    let author: Author?
    struct Attachment : Codable {
        let filename: String
        let mime : String
        let url : String
    }
    let favourite: Bool
    let tips: [String?]?
}
