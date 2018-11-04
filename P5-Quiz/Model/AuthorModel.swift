//
//  AuthorModel.swift
//  P5-Quiz
//
//  Created by Adrian on 04/11/2018.
//  Copyright © 2018 Adrian. All rights reserved.
//

import Foundation

class AuthorModel{
    
    let apiURL = "https://quiz2019.herokuapp.com/api"
    let usersURL = "/users"
    let myToken = "15285c6fd5a9426d00fb"
    var authors: [Author]? = nil
    
    // Stores a new downloaded value author
    func downloadAuthors() {
        //// It is get the athours array
        // 1. It is used a Data Task pattern to do a get transaction over HTTPS: this gives a data object
        
        let session = URLSession.shared // Create a session
        let path = "\(apiURL)\(usersURL)?token=\(myToken)" // Create the path
        guard let url = URL(string: path) else { return } // Unwrap the url
        
        // Create the task
        let task = session.dataTask(with: url){ (data: Data?,
            response: URLResponse?,
            error: Error?) in
            if error == nil && (response as! HTTPURLResponse).statusCode == 200 { // If there are no errors in the connection
                
                guard let data = data else { return } //unwrap the value data
                //                let dataAsString = String(data: data,
                //                                                   encoding: .utf8 )
                //                print(dataAsString)
                
                do{
                    self.authors = try  JSONDecoder().decode([Author].self, from: data)
                    print(self.authors)
                }catch let jsonErr {
                    print("Error serializing json", jsonErr)
                }
            } else { print("Error downloading") }
            
        }
        
        task.resume()
    }
}
