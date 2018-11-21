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
    let apiURL = "https://quiz2019.herokuapp.com/api"
    let usersURL = "/users"
    let quizzesURL = "/quizzes"
    let myToken = "15285c6fd5a9426d00fb"
    var authors = [Author]()
    var quizzesPage = [Quiz]()
    var quizzesAll = [Quiz]()
    var imagesCache = [String:UIImage]()
    
}
