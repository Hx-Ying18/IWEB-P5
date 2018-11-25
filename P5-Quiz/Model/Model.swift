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
    
    //https://quiz2019.herokuapp.com/api/users?token=acc820fa0f4d47c1fd3c
    //https://quiz2019.herokuapp.com/api/quizzes?token=acc820fa0f4d47c1fd3c
    static let apiURL = "https://quiz2019.herokuapp.com/api"
    static let usersURL = "/users"
    static let quizzesURL = "/quizzes"
    static let myToken = "acc820fa0f4d47c1fd3c"
    static var authors = [Author]()
    
    // To check how mnay downloads has been done
    static var quizzesImage = 0
    static var imageDownloaded = 0
    
    // These properties belong to the classes not to the instances
    static var quizzesAll = [Quiz]()
    static var imagesCache = [String:UIImage]()
    
}
