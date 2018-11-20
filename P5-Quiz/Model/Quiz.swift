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
    let attachment: Attachment?
    let favourite: Bool
    let tips: [String]?
}

struct Attachment : Codable {
    let filename: String
    let mime : String
    let url : String
}

struct Answer : Codable {
    let quizId: Int
    let answer : String
    let result : Bool
}
