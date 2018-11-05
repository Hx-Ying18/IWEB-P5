//
//  QuizPage.swift
//  P5-Quiz
//
//  Created by Adrian on 04/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation

struct QuizPage : Decodable {
    let quizzes : [Quiz]
    let pageno: Int
    let nextUrl : String?
}
