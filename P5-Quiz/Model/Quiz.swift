//
//  Quiz.swift
//  P5-Quiz
//
//  Created by Adrian on 04/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation

// Decodable makes it simplier decode it form a JSON

struct QuizPage : Decodable {
    let quizzes : [Quiz]
    let pageno: Int
    let nexurl : String
}

struct Quiz: Decodable {
    let id: Int
    let question: String
    let author: String?
    struct Attachment : Codable {
        let filename: String
        let mime : String
        let url : String
    }
    let favourite: Bool
    let tips: [String]?
}
