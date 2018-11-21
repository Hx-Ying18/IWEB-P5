//
//  AuthorModel.swift
//  P5-Quiz
//
//  Created by Adrian on 04/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation
import UIKit

class Model{
    
    //https://quiz2019.herokuapp.com/api/users?token=15285c6fd5a9426d00fb
    //https://quiz2019.herokuapp.com/api/quizzes?token=15285c6fd5a9426d00fb
    static let apiURL = "https://quiz2019.herokuapp.com/api"
    static let usersURL = "/users"
    static let quizzesURL = "/quizzes"
    static let myToken = "15285c6fd5a9426d00fb"
    static var authors = [Author]()
    
    // These properties belong to the classes not to the instances
    static var quizzesAll = [Quiz]()
    static var imagesCache = [String:UIImage]()
    
}
