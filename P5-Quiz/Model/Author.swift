//
//  Author.swift
//  P5-Quiz
//
//  Created by Adrian on 04/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation

// Decodable makes it simplier decode it form a JSON
struct Author: Decodable {
    let id: Int
    let isAdmin: Bool?
    let username: String?
}
